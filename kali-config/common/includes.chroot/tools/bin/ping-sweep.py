#!/usr/bin/env python3
import os
import sys

def start_sweep(net, first, last):
    for ip in range(int(first), int(last) + 1):
        addr = net + '.' + str(ip)
        command = 'timeout 0.5 ping -c1 ' + addr + ' | grep "64 bytes" | cut -d " " -f 4 | tr -d ":"'
        response = os.popen(command)
        list = response.readlines()

        for line in list:
            if line:
                print(line.strip('\n'))

start_sweep(sys.argv[1], sys.argv[2], sys.argv[3])


