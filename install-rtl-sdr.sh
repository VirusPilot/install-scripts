#!/bin/bash
#set -x

sudo apt update
sudo apt install libusb-1.0-0-dev -y

ARCH=$(getconf LONG_BIT)
if [[ $ARCH -eq 64 ]]; then
    wget http://ftp.de.debian.org/debian/pool/main/r/rtl-sdr/librtlsdr0_0.6.0-4_arm64.deb
    wget http://ftp.de.debian.org/debian/pool/main/r/rtl-sdr/librtlsdr-dev_0.6.0-4_arm64.deb
    wget http://ftp.de.debian.org/debian/pool/main/r/rtl-sdr/rtl-sdr_0.6.0-4_arm64.deb
else
    wget http://ftp.de.debian.org/debian/pool/main/r/rtl-sdr/librtlsdr0_0.6.0-4_armhf.deb
    wget http://ftp.de.debian.org/debian/pool/main/r/rtl-sdr/librtlsdr-dev_0.6.0-4_armhf.deb
    wget http://ftp.de.debian.org/debian/pool/main/r/rtl-sdr/rtl-sdr_0.6.0-4_armhf.deb
fi
sudo dpkg -i *.deb
rm -f *.deb
