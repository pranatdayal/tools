#include <openssl/ssl.h>
#include <openssl/x509.h>
#include <openssl/rc4.h>
#include <openssl/md5.h>
/* read/write buffer */
#define BUFSIZE 16384

/* hardcoded protocol stuff */
#define CHALLENGE_LENGTH 16
#define RC4_KEY_LENGTH 16	/* 128 bits */
#define RC4_KEY_MATERIAL_LENGTH (RC4_KEY_LENGTH*2)

#define SSL_ERROR	0
#define SSL_OK		1

#define SSL_CONNECTION_ERROR	1
#define SSL_PROTOCOL_ERROR		2
#define SSL_SERVER_ERROR		3

/* we keep all SSL2 state in this structure */
struct ssl_conn {
	int sock;

	/* client stuff */
	unsigned char challenge[CHALLENGE_LENGTH];
	unsigned char master_key[RC4_KEY_LENGTH];
	unsigned char key_material[RC4_KEY_MATERIAL_LENGTH];

	/* connection id - returned by the server */
	int conn_id_length;
	unsigned char conn_id[SSL_MAX_SSL_SESSION_ID_LENGTH];

	/* server certificate */
	X509 *x509;

	/* session keys */
	unsigned char* read_key;
	unsigned char* write_key;
	RC4_KEY rc4_read_key;
	RC4_KEY rc4_write_key;

	/* sequence numbers, used for MAC calculation */
	int read_seq;
	int write_seq;

	/* set to 1 when the SSL2 handshake is complete */
	int encrypted;

	int verbose;

	/* buffer for error messages */
	int err;
	char err_buf[1024];

	/* the values of the cipher and ciphers variables in the SSL_SESSION struct */
	uint32_t cipher;
	uint32_t ciphers;
};

/* SSL functions */

int get_local_port(int sock);
int connect_host(in_addr_t host, int port);
struct ssl_conn* ssl_connect_host(in_addr_t host, int port, int verbose);

int send_client_hello(struct ssl_conn *ssl);
int get_server_hello(struct ssl_conn* ssl);
int send_client_master_key(struct ssl_conn* ssl, unsigned char* key_arg_overwrite, int key_arg_overwrite_len);
void generate_session_keys(struct ssl_conn* ssl);
int get_server_verify(struct ssl_conn* ssl);
int send_client_finished(struct ssl_conn* ssl);
int get_server_finished(struct ssl_conn* ssl, unsigned char* buf, int buf_size);
int get_server_error(struct ssl_conn* ssl);
int ssl_close(struct ssl_conn *ssl);

/* EOF */
