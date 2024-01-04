#!/bin/bash
#set -x

sudo apt update
sudo apt install git libusb-1.0-0-dev debhelper -y

# install librtlsdr Debian Package from https://github.com/osmocom/rtl-sdr fork
cd
sudo apt purge ^librtlsdr
sudo rm -rvf /usr/lib/librtlsdr* /usr/include/rtl-sdr* /usr/local/lib/librtlsdr* /usr/local/include/rtl-sdr* /usr/local/include/rtl_* /usr/local/bin/rtl_*
git clone https://github.com/VirusPilot/rtl-sdr.git
cd rtl-sdr
sudo dpkg-buildpackage -b --no-sign
cd ..
sudo dpkg -i librtlsdr0_*.deb
sudo dpkg -i librtlsdr-dev_*.deb
sudo dpkg -i rtl-sdr_*.deb
