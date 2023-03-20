#!/bin/bash
for ip in `seq $2 $3`
do
    timeout 0.5 ping -c1 $1.$ip | grep "64 bytes" | cut -d " " -f 4 | tr -d ":"
done
