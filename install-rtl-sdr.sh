#!/bin/bash
#set -x

ARCH=$(getconf LONG_BIT)
DIST=$(lsb_release -r -s)

sudo apt update
sudo apt install libusb-1.0-0-dev -y

sudo apt purge ^librtlsdr

sudo rm -rf /usr/lib/librtlsdr*
sudo rm -rf /usr/include/rtl-sdr*
sudo rm -rf /usr/local/lib/librtlsdr*
sudo rm -rf /usr/local/lib/aarch64-linux-gnu/librtlsdr*
sudo rm -rf /usr/local/include/rtl-sdr*
sudo rm -rf /usr/local/include/rtl_*
sudo rm -rf /usr/local/bin/rtl_*

# install librtlsdr from http://ftp.de.debian.org/debian/pool/main/r/rtl-sdr
if [ $ARCH -eq 64 ] && [ "$DIST" -eq 12 ]; then
    wget http://ftp.de.debian.org/debian/pool/main/r/rtl-sdr/librtlsdr0_2.0.2-2_arm64.deb
    wget http://ftp.de.debian.org/debian/pool/main/r/rtl-sdr/librtlsdr-dev_2.0.2-2_arm64.deb
    wget http://ftp.de.debian.org/debian/pool/main/r/rtl-sdr/rtl-sdr_2.0.2-2_arm64.deb
fi
if [ $ARCH -eq 32 ] && [ "$DIST" -eq 12 ]; then
    wget http://ftp.de.debian.org/debian/pool/main/r/rtl-sdr/librtlsdr0_2.0.2-2_armhf.deb
    wget http://ftp.de.debian.org/debian/pool/main/r/rtl-sdr/librtlsdr-dev_2.0.2-2_armhf.deb
    wget http://ftp.de.debian.org/debian/pool/main/r/rtl-sdr/rtl-sdr_2.0.2-2_armhf.deb
fi 
if [ $ARCH -eq 64 ] && [ "$DIST" -eq 11 ]; then # no RTL-SDR Blog V4 dongle support
    wget http://ftp.de.debian.org/debian/pool/main/r/rtl-sdr/librtlsdr0_0.6.0-4_arm64.deb
    wget http://ftp.de.debian.org/debian/pool/main/r/rtl-sdr/librtlsdr-dev_0.6.0-4_arm64.deb
    wget http://ftp.de.debian.org/debian/pool/main/r/rtl-sdr/rtl-sdr_0.6.0-4_arm64.deb
fi
if [ $ARCH -eq 32 ] && [ "$DIST" -eq 11 ]; then # no RTL-SDR Blog V4 dongle support
    wget http://ftp.de.debian.org/debian/pool/main/r/rtl-sdr/librtlsdr0_0.6.0-4_armhf.deb
    wget http://ftp.de.debian.org/debian/pool/main/r/rtl-sdr/librtlsdr-dev_0.6.0-4_armhf.deb
    wget http://ftp.de.debian.org/debian/pool/main/r/rtl-sdr/rtl-sdr_0.6.0-4_armhf.deb
fi

sudo dpkg -i *.deb
sudo rm -f *.deb
sudo ldconfig
