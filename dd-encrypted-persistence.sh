#!/bin/bash
# This script automates the process of copying the ctf-live iso to /dev/sdb with encrypted persistence
# Not responsible if you wipe the wrong device

echo "Enter name of device to image (default: sdb)"
read devname
devname="${devname:=sdb}" && devdevice="$devname \b3"
echo "[+] Copying iso to Disk /dev/$devname"
dd if=./images/kali-linux-ctf-live-amd64.iso of=/dev/$devname conv=fsync bs=4M status=progress && echo "[+] Sleeping for 15 seconds" && sleep 15 && echo "[+] Creating new partion /dev/$devname" && fdisk /dev/$devname <<< $(printf "n\np\n\n\n\nw")
echo "[+] Sleeping for 15 seconds"
sleep 15
echo "[+] Displaying Blocks"
lsblk
echo "[+] Setting up crypt"
cryptsetup --batch-mode --verbose --verify-passphrase luksFormat /dev/$devdevice
cryptsetup luksOpen /dev/$devdevice my_usb
echo "[+] Creating ext4 File System"
mkfs.ext4 -L persistence /dev/mapper/my_usb
e2label /dev/mapper/my_usb persistence
echo "[+] Creating Persistence conf file"
mkdir -p /mnt/my_usb
mount /dev/mapper/my_usb /mnt/my_usb
echo "/ union" | sudo tee /mnt/my_usb/persistence.conf
echo "[+] Cleaning up"
umount /dev/mapper/my_usb
cryptsetup luksClose /dev/mapper/my_usb
echo "[+] Done"
