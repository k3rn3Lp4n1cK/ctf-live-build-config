# Custom Kali Live CTF Image
```bash
# Build an image
sudo ./build.sh -v --live --version ctf

# DD image to a usb stick /dev/sdb
STICK=/dev/sdb
sudo dd if=./images/kali-linux-ctf-live-amd64.iso of=$STICK conv=fsync bs=4M status=progress

# Cleanup
sudo ./build.sh --clean && sudo rm -fr .build build.log config images
```

## live-build configuration for Kali ISO images Documentation

Have a look at [Live Build a Custom Kali ISO](https://www.kali.org/docs/development/live-build-a-custom-kali-iso/) for explanations on how to use this repository.
