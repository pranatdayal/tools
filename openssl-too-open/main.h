/* host to big endian conversions */
#define htobes(i, p)	if ( (((uint8_t*)p)[0] = (((i) >> 8) & 0xff)) | \
						  (((uint8_t*)p)[1] = ((i) & 0xff)) ) {}

#define htobel(i, p)	if ( (((uint8_t*)p)[0] = (((i) >> 24) & 0xff)) | \
						  (((uint8_t*)p)[1] = (((i) >> 16) & 0xff)) | \
						  (((uint8_t*)p)[2] = (((i) >> 8) & 0xff)) | \
						  (((uint8_t*)p)[3] = ((i) & 0xff)) ) {}

/* host to little endian conversions */
#define htoles(i, p)	if ( (((uint8_t*)p)[1] = (((i) >> 8) & 0xff)) | \
						  (((uint8_t*)p)[0] = ((i) & 0xff)) ) {}

#define htolel(i, p)	if ( (((uint8_t*)p)[3] = (((i) >> 24) & 0xff)) | \
						  (((uint8_t*)p)[2] = (((i) >> 16) & 0xff)) | \
						  (((uint8_t*)p)[1] = (((i) >> 8) & 0xff)) | \
						  (((uint8_t*)p)[0] = ((i) & 0xff)) ) {}

/* big endian to host conversions */
#define betohs(p)		( (((uint32_t)((uint8_t*)p)[0]) << 8) | \
						  (((uint32_t)((uint8_t*)p)[1])) )

#define betohl(p)		( (((uint32_t)((uint8_t*)p)[0]) << 24) | \
						  (((uint32_t)((uint8_t*)p)[1]) << 16) | \
						  (((uint32_t)((uint8_t*)p)[2]) << 8) | \
						  (((uint32_t)((uint8_t*)p)[3])) )

/* little endian to host conversions */
#define letohs(p)		( (((uint32_t)((uint8_t*)p)[1]) << 8) | \
						  (((uint32_t)((uint8_t*)p)[0])) )

#define letohl(p)		( (((uint32_t)((uint8_t*)p)[3]) << 24) | \
						  (((uint32_t)((uint8_t*)p)[2]) << 16) | \
						  (((uint32_t)((uint8_t*)p)[1]) << 8) | \
						  (((uint32_t)((uint8_t*)p)[0])) )

typedef uint32_t (*get_cipher_func)(unsigned char*, int);
typedef int (*build_shellcode_func)(unsigned char*, int, int, uint32_t, uint32_t, uint32_t);

/* This structure defines a target architecture */
struct architecture {
	char* desc;		/* description */

	unsigned char* overwrite_session_id_length;
	int overwrite_session_id_length_len;

	/* stage2 shellcode */
	unsigned char* shellcode_stage2;
	int shellcode_stage2_len;

	/* the tag written by the stage1 shellcode */
	unsigned char* tag;
	int tag_len;

	get_cipher_func get_cipher;
	get_cipher_func get_ciphers;
	build_shellcode_func build_shellcode;
};

/* EOF */
