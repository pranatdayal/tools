#!/bin/bash
#does port knocking
#./knock.sh <ip> [port1 [port2 [...]]

HOST=$1
shift
for ARG in "$@"
do
    nmap -Pn --host_timeout 100 --max-retries 0 -p $ARG $HOST
done
