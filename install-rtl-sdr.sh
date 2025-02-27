#!/bin/bash
#set -x

sudo apt update
sudo apt install git cmake libusb-1.0-0-dev debhelper -y

sudo apt purge ^librtlsdr

sudo rm -rf /usr/lib/librtlsdr*
sudo rm -rf /usr/include/rtl-sdr*
sudo rm -rf /usr/local/lib/librtlsdr*
sudo rm -rf /usr/local/lib/aarch64-linux-gnu/librtlsdr*
sudo rm -rf /usr/local/include/rtl-sdr*
sudo rm -rf /usr/local/include/rtl_*
sudo rm -rf /usr/local/bin/rtl_*

# compile and install librtlsdr from https://github.com/osmocom/rtl-sdr
cd
git clone https://github.com/osmocom/rtl-sdr
cd rtl-sdr
sudo dpkg-buildpackage -b --no-sign
cd
sudo dpkg -i *.deb
rm -f *.deb
rm -f *.buildinfo
rm -f *.changes
