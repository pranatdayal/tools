/* Sample usage:

	struct ssl_conn* ssl;
	
	ssl = ssl_connect_host(host, port);

	send_client_hello(ssl);
	get_server_hello(ssl);
	send_client_master_key(ssl, buf, len);
	generate_session_keys(ssl);
	get_server_verify(ssl);
	send_client_finished(ssl);
	len = get_server_finished(ssl1, buf, BUFSIZE);
*/

#include <arpa/inet.h>
#include <netinet/in.h>
#include <sys/types.h>
#include <sys/socket.h>
#include <unistd.h>
#include <errno.h>
#include <string.h>
#include <stdio.h>

#include <openssl/ssl.h>
#include <openssl/rsa.h>
#include <openssl/x509.h>
#include <openssl/evp.h>

#include "ssl2.h"

extern int errno;

/* straight from the openssl source */
#define n2s(c,s)    ((s=(((unsigned int)(c[0]))<< 8)| \
	(((unsigned int)(c[1]))    )),c+=2)
#define s2n(s,c)    ((c[0]=(unsigned char)(((s)>> 8)&0xff), \
	c[1]=(unsigned char)(((s)    )&0xff)),c+=2)

/* Returns the local port of a connected socket */
int get_local_port(int sock)
{
	struct sockaddr_in s_in;
	unsigned int namelen = sizeof(s_in);

	if (getsockname(sock, (struct sockaddr *)&s_in, &namelen) < 0) {
		printf("Can't get local port: %s\n", strerror(errno));
		exit(1);
	}

	return ntohs(s_in.sin_port);
}

/* Connect to a host */
int connect_host(in_addr_t host, int port)
{
	struct sockaddr_in s_in;
	int sock;

	s_in.sin_family = AF_INET;
	s_in.sin_addr.s_addr = host;
	s_in.sin_port = htons(port);

	if ((sock = socket(AF_INET, SOCK_STREAM, 0)) <= 0) {
		printf("Could not create a socket\n");
		exit(1);
	}

	if (connect(sock, (struct sockaddr *)&s_in, sizeof(s_in)) < 0) {
		printf("Connection failed: %s\n", strerror(errno));
		exit(1);
	}

	return sock;
}

/* Create a new ssl_conn structure and connect to a host */
struct ssl_conn* ssl_connect_host(in_addr_t host, int port, int verbose)
{
	struct ssl_conn* ssl;
	
	if (verbose) printf(" -> ssl_connect_host\n");

	if (!(ssl = (struct ssl_conn*) malloc(sizeof(struct ssl_conn)))) {
		printf("Can't allocate memory\n");
		exit(1);
	}
	
	/* Initialize some values */
	ssl->encrypted = 0;
	ssl->write_seq = 0;
	ssl->read_seq = 0;
	ssl->verbose = verbose;

	ssl->cipher = 0;
	ssl->ciphers = 0;

	ssl->sock = connect_host(host, port);

	return ssl;
}

/* closes the socket and destroys the ssl structure */
int ssl_close(struct ssl_conn* ssl)
{
	close(ssl->sock);
	free(ssl);

	return 0;
}

/* converts an SSL error code to a string */
int ssl_error(struct ssl_conn* ssl, int code)
{
	ssl->err = SSL_SERVER_ERROR;
	
	switch (code) {
		case 0x00:	sprintf(ssl->err_buf, "Server error: SSL2_PE_UNDEFINED_ERROR (0x00)");
					break;
		case 0x01:	sprintf(ssl->err_buf, "Server error: SSL2_PE_NO_CIPHER (0x01)");
					break;
		case 0x02:	sprintf(ssl->err_buf, "Server error: SSL2_PE_NO_CERTIFICATE (0x02)");
					break;
		case 0x04:	sprintf(ssl->err_buf, "Server error: SSL2_PE_BAD_CERTIFICATE (0x03)");
					break;
		case 0x06:	sprintf(ssl->err_buf, "Server error: SSL2_PE_UNSUPPORTED_CERTIFICATE_TYPE (0x06)");
					break;
	default:
		sprintf(ssl->err_buf, "Unrecognized server error: 0x%02x", code);
	}

	return SSL_ERROR;
}


/* read len bytes from a socket. Returns 0 when the connection is closed */
int read_data(int sock, unsigned char* buf, int len)
{
	int l;
	int to_read = len;

	do {
		if ((l = read(sock, buf, to_read)) < 0) {
			printf("Error in read: %s\n", strerror(errno));
			exit(1);
		}
		else if (!l) {
			return 0;
		}
		to_read -= l;
	} while (to_read > 0);

	return len;
}

/* reads an SSL packet and decrypts it if necessery */
int read_ssl_packet(struct ssl_conn* ssl, unsigned char* buf, int buf_size)
{
	int rec_len, padding;

	if (!read_data(ssl->sock, buf, 2)) {
		ssl->err = SSL_CONNECTION_ERROR;
		sprintf(ssl->err_buf, "Connection unexpectedly closed");
		return SSL_ERROR;
	}
	
	if ((buf[0] & 0x80) == 0) {
		/* three byte header */
		rec_len = ((buf[0] & 0x3f) << 8) | buf[1];
		read_data(ssl->sock, &buf[2], 1);
		padding = (int)buf[2];
	}
	else {
		/* two byte header */
		rec_len = ((buf[0] & 0x7f) << 8) | buf[1];
		padding = 0;
	}
	
	if ((rec_len == 0) || (rec_len > buf_size)) {
		ssl->err = SSL_PROTOCOL_ERROR;
		sprintf(ssl->err_buf, "read_ssl_packet: Record length out of range (rec_len = %d)", rec_len);
		return SSL_ERROR;
	}

	if (!read_data(ssl->sock, buf, rec_len)) {
		ssl->err = SSL_CONNECTION_ERROR;
		sprintf(ssl->err_buf, "Connection unexpectedly closed");
		return SSL_ERROR;
	}

	if (ssl->encrypted) {
		if (MD5_DIGEST_LENGTH + padding >= rec_len) {
			if ((buf[0] == SSL2_MT_ERROR) && (rec_len == 3)) {
				/* the server didn't switch to encryption due to an error */
				ssl_error(ssl, ntohs(*(uint16_t*)&buf[1]));
				return SSL_ERROR;
			}
			else {
				ssl->err = SSL_PROTOCOL_ERROR;
				sprintf(ssl->err_buf, "read_ssl_packet: Encrypted message is too short (rec_len = %d)", rec_len);
				return SSL_ERROR;
			}
		}

		/* decrypt the encrypted part of the packet */
		RC4(ssl->rc4_read_key, rec_len, buf, buf);
		
		/* move the decrypted message in the beginning of the buffer */
		rec_len = rec_len - MD5_DIGEST_LENGTH - padding;
		memmove(buf, buf + MD5_DIGEST_LENGTH, rec_len);
	}
	
	if (buf[0] == SSL2_MT_ERROR) {
		if (rec_len != 3) {
			ssl->err = SSL_PROTOCOL_ERROR;
			sprintf(ssl->err_buf, "read_ssl_packet: Malformed server error message");
			return SSL_ERROR;
		}
		else {
			ssl_error(ssl, ntohs(*(uint16_t*)&buf[1]));
			return SSL_ERROR;
		}
	}
	
	return rec_len;
}

/* send an ssl packet, encrypting it if ssl->encrypted is set */
void send_ssl_packet(struct ssl_conn* ssl, unsigned char* rec, int rec_len)
{
	unsigned char buf[BUFSIZE];
	unsigned char* p;
	int tot_len;
	MD5_CTX ctx;
	int seq;
	

	if (ssl->encrypted)
		tot_len = rec_len + MD5_DIGEST_LENGTH;	/* RC4 needs no padding */
	else
		tot_len = rec_len;

	if (2 + tot_len > BUFSIZE) {
		printf("send_ssl_packet: Record length out of range (rec_len = %d)\n", rec_len);
		exit(1);
	}
	
	p = buf;
	s2n(tot_len, p);	

	buf[0] = buf[0] | 0x80;	/* two byte header */

	if (ssl->encrypted) {
		/* calculate the MAC */
		seq = ntohl(ssl->write_seq);

		MD5_Init(&ctx);
		MD5_Update(&ctx, ssl->write_key, RC4_KEY_LENGTH);
		MD5_Update(&ctx, rec, rec_len);
		MD5_Update(&ctx, &seq, 4);
		MD5_Final(p, &ctx);
	
		p+=MD5_DIGEST_LENGTH;
		
		memcpy(p, rec, rec_len);
		
		/* encrypt the payload */
		RC4(ssl->rc4_write_key, tot_len, &buf[2], &buf[2]);

	}
	else {
		memcpy(p, rec, rec_len);
	}

	if (send(ssl->sock, buf, 2 + tot_len, 0) == -1) {
		printf("Error in send: %s\n", strerror(errno));
		exit(1);
	}

	/* the sequence number is incremented by both encrypted and plaintext packets */
	ssl->write_seq++;
}

/* Send a CLIENT_HELLO message to the server */
int send_client_hello(struct ssl_conn *ssl)
{
	int i;
	unsigned char buf[BUFSIZE] =
		"\x01"			/* client hello msg */
	
		"\x00\x02"		/* client version */
		"\x00\x18"		/* cipher specs length */
		"\x00\x00"		/* session id length */
		"\x00\x10"		/* challenge length */

		"\x07\x00\xc0\x05\x00\x80\x03\x00"	/* cipher specs data */
		"\x80\x01\x00\x80\x08\x00\x80\x06"
		"\x00\x40\x04\x00\x80\x02\x00\x80"
	
		"";									/* session id data */

	if (ssl->err) return SSL_ERROR;

	if (ssl->verbose) printf(" -> send_client_hello\n");

	/* generate CHALLENGE_LENGTH bytes of challenge data */
	for (i = 0; i < CHALLENGE_LENGTH; i++) {
		ssl->challenge[i] = (unsigned char) (rand() >> 24);
	}
	memcpy(&buf[33], ssl->challenge, CHALLENGE_LENGTH);

	send_ssl_packet(ssl, buf, 33 + CHALLENGE_LENGTH);

	return SSL_OK;
}

/* Get a SERVER_HELLO response from the server */
int get_server_hello(struct ssl_conn* ssl)
{
	unsigned char buf[BUFSIZE];
	unsigned char *p, *end;
	int len;
	int server_version, cert_length, cs_length, conn_id_length;
	int found;

	if (ssl->err) return SSL_ERROR;
	
	if (ssl->verbose) printf(" -> get_server_hello\n");

	if (!(len = read_ssl_packet(ssl, buf, sizeof(buf)))) {
		return SSL_ERROR;
	}
	
	if (len < 11) {
		ssl->err = SSL_PROTOCOL_ERROR;
		sprintf(ssl->err_buf, "get_server_hello: Packet too short (len = %d)", len);
		return SSL_ERROR;
	}
	
	p = buf;

	if (*(p++) != SSL2_MT_SERVER_HELLO) {
		ssl->err = SSL_PROTOCOL_ERROR;
		sprintf(ssl->err_buf, "get_server_hello: Expected SSL2_MT_SERVER_HELLO, got 0x%02x", (int)p[-1]);
		return SSL_ERROR;
	}

	if (*(p++) != 0) {
		ssl->err = SSL_PROTOCOL_ERROR;
		sprintf(ssl->err_buf, "get_server_hello: SESSION-ID-HIT is not 0");
		return SSL_ERROR;
	}

	if (*(p++) != 1) {
		ssl->err = SSL_PROTOCOL_ERROR;
		sprintf(ssl->err_buf, "get_server_hello: CERTIFICATE-TYPE is not SSL_CT_X509_CERTIFICATE");
		return SSL_ERROR;
	}

	n2s(p, server_version);
	if (server_version != 2) {
		ssl->err = SSL_PROTOCOL_ERROR;
		sprintf(ssl->err_buf, "get_server_hello: Unsupported server version %d", server_version);
		return SSL_ERROR;
	}

	n2s(p, cert_length);
	n2s(p, cs_length);
	n2s(p, conn_id_length);

	if (len != 11 + cert_length + cs_length + conn_id_length) {
		ssl->err = SSL_PROTOCOL_ERROR;
		sprintf(ssl->err_buf, "get_server_hello: Malformed packet size");
		return SSL_ERROR;
	}

	/* read the server certificate */
	ssl->x509 = NULL;
	ssl->x509=d2i_X509(NULL,&p,(long)cert_length);
	if (ssl->x509 == NULL) {
		ssl->err = SSL_PROTOCOL_ERROR;
		sprintf(ssl->err_buf, "get_server_hello: Cannot parse x509 certificate");
		return SSL_ERROR;
	}

	if (cs_length % 3 != 0) {
		ssl->err = SSL_PROTOCOL_ERROR;
		sprintf(ssl->err_buf, "get_server_hello: CIPHER-SPECS-LENGTH is not a multiple of 3");
		return SSL_ERROR;
	}

	found = 0;
	for (end=p+cs_length; p < end; p += 3) {
		if ((p[0] == 0x01) && (p[1] == 0x00) && (p[2] == 0x80))
			found = 1;	/* SSL_CK_RC4_128_WITH_MD5 */
	}

	if (!found) {
		ssl->err = SSL_PROTOCOL_ERROR;
		sprintf(ssl->err_buf, "get_server_hello: Remote server does not support 128 bit RC4");
		return SSL_ERROR;
	}

	if (conn_id_length > SSL2_MAX_CONNECTION_ID_LENGTH) {
		ssl->err = SSL_PROTOCOL_ERROR;
		sprintf(ssl->err_buf, "get_server_hello: CONNECTION-ID-LENGTH is too long");
		return SSL_ERROR;
	}

	/* The connection id is sent back to the server in the CLIENT_FINISHED packet */
	ssl->conn_id_length = conn_id_length;
	memcpy(ssl->conn_id, p, conn_id_length);

	return SSL_OK;
}

/* Send a CLIENT_MASTER_KEY message to the server */
int send_client_master_key(struct ssl_conn* ssl, unsigned char* key_arg_overwrite, int key_arg_overwrite_len)
{
	int encrypted_key_length, key_arg_length, record_length;
	unsigned char* p;
	int i;
	EVP_PKEY *pkey=NULL;
	
	unsigned char buf[BUFSIZE] =
		"\x02"			/* client master key message */
		"\x01\x00\x80"	/* cipher kind */
		"\x00\x00"		/* clear key length */
		"\x00\x40"		/* encrypted key length */
		"\x00\x08";		/* key arg length */

	if (ssl->err) return SSL_ERROR;
	
	if (ssl->verbose) printf(" -> send_client_master_key\n");

	p = &buf[10];

	/* generate a 128 byte master key */
	for (i = 0; i < RC4_KEY_LENGTH; i++) {
		ssl->master_key[i] = (unsigned char) (rand() >> 24);
	}
	
	pkey=X509_get_pubkey(ssl->x509);
	if (!pkey) {
		ssl->err = SSL_PROTOCOL_ERROR;
		sprintf(ssl->err_buf, "send_client_master_key: No public key in the server certificate");
		return SSL_ERROR;
	}

	if (pkey->type != EVP_PKEY_RSA) {
		ssl->err = SSL_PROTOCOL_ERROR;
		sprintf(ssl->err_buf, "send_client_master_key: The public key in the server certificate is not a RSA key");
		return SSL_ERROR;
	}
	
	/* Encrypt the client master key with the server public key and put it in the packet */
	encrypted_key_length = RSA_public_encrypt(RC4_KEY_LENGTH, ssl->master_key, &buf[10],
		pkey->pkey.rsa, RSA_PKCS1_PADDING);
	if (encrypted_key_length <= 0) {
		ssl->err = SSL_PROTOCOL_ERROR;
		sprintf(ssl->err_buf, "send_client_master_key: RSA encryption failure");
		return SSL_ERROR;
	}

	p += encrypted_key_length;
	
	if (key_arg_overwrite) {
		/* These 8 bytes fill the key_arg array on the server */
		for (i = 0; i < 8; i++) {
			*(p++) = (unsigned char) (rand() >> 24);
		}
		/* This overwrites the data following the key_arg array */
		memcpy(p, key_arg_overwrite, key_arg_overwrite_len);
	
		key_arg_length = 8 + key_arg_overwrite_len;
	}
	else {
		key_arg_length = 0;	/* RC4 doesn't use KEY-ARG */
	}

	p = &buf[6];
	s2n(encrypted_key_length, p);
	s2n(key_arg_length, p);
	
	record_length = 10 + encrypted_key_length + key_arg_length;
	send_ssl_packet(ssl, buf, record_length);

	/* all following messages should be encrypted */
	ssl->encrypted = 1;

	return SSL_OK;
}

/* Generate the key material using the algorithm described in the SSL2 specification */
void generate_key_material(struct ssl_conn* ssl)
{
	unsigned int i;
	MD5_CTX ctx;
	unsigned char *km;
	unsigned char c='0';

	km=ssl->key_material;
	for (i=0; i<RC4_KEY_MATERIAL_LENGTH; i+=MD5_DIGEST_LENGTH) {
		MD5_Init(&ctx);

		MD5_Update(&ctx,ssl->master_key,RC4_KEY_LENGTH);
		MD5_Update(&ctx,&c,1);
		c++;
		MD5_Update(&ctx,ssl->challenge,CHALLENGE_LENGTH);
		MD5_Update(&ctx,ssl->conn_id, ssl->conn_id_length);
		MD5_Final(km,&ctx);
		km+=MD5_DIGEST_LENGTH;
	}
}

/* Generate the RC4 session read and write keys */
void generate_session_keys(struct ssl_conn* ssl)
{
	if (ssl->err) return;

	if (ssl->verbose) printf(" -> generate_session_keys\n");
	
	generate_key_material(ssl);

	ssl->read_key = &(ssl->key_material[0]);
	ssl->rc4_read_key = (RC4_KEY*) malloc(sizeof(RC4_KEY));
	RC4_set_key(ssl->rc4_read_key, RC4_KEY_LENGTH, ssl->read_key);

	ssl->write_key = &(ssl->key_material[RC4_KEY_LENGTH]);
	ssl->rc4_write_key = (RC4_KEY*) malloc(sizeof(RC4_KEY));
	RC4_set_key(ssl->rc4_write_key, RC4_KEY_LENGTH, ssl->write_key);
}

/* Get a SERVER_VERIFY response from the server */
int get_server_verify(struct ssl_conn* ssl)
{
	unsigned char buf[BUFSIZE];
	int len;

	if (ssl->err) return SSL_ERROR;

	if (ssl->verbose) printf(" -> get_server_verify\n");

	if (!(len = read_ssl_packet(ssl, buf, sizeof(buf)))) {
		if (ssl->err == SSL_CONNECTION_ERROR)
			sprintf(ssl->err_buf, "Connection closed after KEY_ARG data was sent. Server is most likely not vulnerable.");
		else if (ssl->err == SSL_SERVER_ERROR)
			strcat(ssl->err_buf, " after KEY_ARG data was sent. Server is not vulnerable.");
		return SSL_ERROR;
	}
		
	if (len != 1 + CHALLENGE_LENGTH) {
		ssl->err = SSL_PROTOCOL_ERROR;
		sprintf(ssl->err_buf, "get_server_verify: Malformed packet size");
		return SSL_ERROR;
	}
	
	if (buf[0] != SSL2_MT_SERVER_VERIFY) {
		ssl->err = SSL_PROTOCOL_ERROR;
		sprintf(ssl->err_buf, "get_server_verify: Expected SSL2_MT_SERVER_VERIFY, got 0x%02x", (int)buf[0]);
		return SSL_ERROR;
	}

	/* If this works, our decryption key is correct */
	if (memcmp(ssl->challenge, &buf[1], CHALLENGE_LENGTH)) {
		ssl->err = SSL_PROTOCOL_ERROR;
		sprintf(ssl->err_buf, "get_server_verify: Challenge strings don't match");
		return SSL_ERROR;
	}

	return SSL_OK;
}

/* Send a CLIENT_FINISHED message to the server */
int send_client_finished(struct ssl_conn* ssl)
{
	unsigned char buf[BUFSIZE];

	if (ssl->err) return SSL_ERROR;
	
	if (ssl->verbose) printf(" -> send_client_finished\n");

	buf[0] = SSL2_MT_CLIENT_FINISHED;
	memcpy(&buf[1], ssl->conn_id, ssl->conn_id_length);
	
	send_ssl_packet(ssl, buf, 1+ssl->conn_id_length);

	return SSL_OK;
}

/* Get a SERVER_FINISHED message from the server */
int get_server_finished(struct ssl_conn* ssl, unsigned char* session_buf, int session_size)
{
	unsigned char buf[BUFSIZE];
	int len;

	if (ssl->err) return SSL_ERROR;

	if (ssl->verbose) printf(" -> get_server_finished\n");

	if (!(len = read_ssl_packet(ssl, buf, sizeof(buf)))) {
		if (ssl->err == SSL_CONNECTION_ERROR)
			sprintf(ssl->err_buf, "Connection closed while waiting for the SERVER_FINISHED message. This was not supposed to happen.");
		else if (ssl->err == SSL_SERVER_ERROR)
			strcat(ssl->err_buf, " while waiting for the SERVER_FINISHED message. This was not supposed to happen.");
		return SSL_ERROR;
	}

	if (buf[0] != SSL2_MT_SERVER_FINISHED) {
		ssl->err = SSL_PROTOCOL_ERROR;
		sprintf(ssl->err_buf, "get_server_finished: Expected SSL2_MT_SERVER_FINISHED, got %02x", (int)buf[0]);
		return SSL_ERROR;
	}

	if (session_buf != NULL) {
		if (len-1 == 0) {
			ssl->err = SSL_PROTOCOL_ERROR;
			sprintf(ssl->err_buf, "get_server_finished: Session data too short (%d bytes)", len-1);
			return SSL_ERROR;
		}
		if (len-1 > session_size) {
			ssl->err = SSL_PROTOCOL_ERROR;
			sprintf(ssl->err_buf, "get_server_finished: Session data too long (%d bytes)", len-1);
			return SSL_ERROR;
		}

		memcpy(session_buf, &buf[1], len-1);
	}

	return len-1;
}

int get_server_error(struct ssl_conn* ssl)
{
	unsigned char buf[BUFSIZE];
	int len;

	if (ssl->err) return SSL_ERROR;
	
	if (ssl->verbose) printf(" -> get_server_error\n");

	len = read_ssl_packet(ssl, buf, sizeof(buf));

	if (!len && ssl->err == SSL_SERVER_ERROR)
		ssl->err = 0;
		return SSL_OK;
	
	if (!len && ssl->err == SSL_CONNECTION_ERROR) {
		sprintf(ssl->err_buf, "Connection closed after SSL_SESSION_free was executed. Server crashed.");
		return SSL_ERROR;
	}

	if (!len) {
		return SSL_ERROR;
	}
	else {
		ssl->err = SSL_PROTOCOL_ERROR;
		sprintf(ssl->err_buf, "Server responded with a 0x%02x message, SSL2_MT_ERROR expected", (int)buf[0]);
		return SSL_ERROR;
	}
}

/* EOF */
