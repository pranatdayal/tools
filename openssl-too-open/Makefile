CC=gcc
CFLAGS=-g -O0 -Wall
LDFLAGS=-g -lcrypto

OBJS_EX=main.o ssl2.o linux-x86.o
SRCS_EX=main.c ssl2.c linux-x86.c \
        main.h ssl2.h

OBJS_SC=scanner.o ssl2.o
SRCS_EX=scanner.c ssl2.c \
        scanner.h ssl2.h

all: openssl-too-open openssl-scanner

openssl-too-open: $(OBJS_EX)
	$(CC) $(LDFLAGS) -o openssl-too-open $(OBJS_EX)

openssl-scanner: $(OBJS_SC)
	$(CC) $(LDFLAGS) -o openssl-scanner $(OBJS_SC)

main.o: main.h ssl2.h
scanner.o: ssl2.h
ssl2.o: ssl2.h
linux-ppc.o: main.h
linux-x86.o: main.h

%.o:	%.c
	$(CC) $(CFLAGS) -c $<

clean:
	rm -rf $(OBJS_EX) $(OBJS_SC) openssl-too-open openssl-scanner *~
