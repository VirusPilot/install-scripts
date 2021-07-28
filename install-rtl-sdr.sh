#!/bin/bash
#set -x

sudo apt update
sudo apt install libusb-1.0-0-dev cmake git libtool -y

# prevent kernel modules claiming use of the SDR
echo blacklist dvb_usb_rtl28xxu | sudo tee -a /etc/modprobe.d/rtl-sdr-blacklist.conf
echo blacklist dvb_usb_v2 | sudo tee -a /etc/modprobe.d/rtl-sdr-blacklist.conf
echo blacklist rtl2830 | sudo tee -a /etc/modprobe.d/rtl-sdr-blacklist.conf
echo blacklist rtl2832 | sudo tee /etc/modprobe.d/rtl-sdr-blacklist.conf
echo blacklist r820t | sudo tee -a /etc/modprobe.d/rtl-sdr-blacklist.conf
echo blacklist rtl8xxxu | sudo tee -a /etc/modprobe.d/rtl-sdr-blacklist.conf

cd
rm -rf rtl-sdr
git clone https://github.com/osmocom/rtl-sdr.git
cd rtl-sdr
mkdir build && cd build
cmake ../ -DENABLE_ZEROCOPY=0
make && make install && ldconfig
cd
rm -rf rtl-sdr
