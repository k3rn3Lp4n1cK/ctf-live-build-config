#!/bin/bash
# sudo iptables -I INPUT -p tcp --dport 443 -m tcp --syn -j LOG --log-prefix="443-IN : "
journalctl -f -n 0| grep --line-buffered '443-IN' | while read line; i=$(shuf -i 1-4 -n 1); echo -e "----==== TCP 443 IN ====----\n" $line; do play /tools/alert/alert$i.mp3 &>/dev/null; done
