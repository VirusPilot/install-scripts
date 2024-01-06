#!/bin/bash
#set -x

sudo apt update
sudo apt install git libusb-1.0-0-dev cmake -y

# install librtlsdr from https://github.com/osmocom/rtl-sdr VirusPilot fork
cd
sudo apt purge ^librtlsdr
sudo rm -rvf /usr/lib/librtlsdr*
sudo rm -rvf /usr/include/rtl-sdr*
sudo rm -rvf /usr/local/lib/librtlsdr*
sudo rm -rvf /usr/local/lib/aarch64-linux-gnu/librtlsdr*
sudo rm -rvf /usr/local/include/rtl-sdr*
sudo rm -rvf /usr/local/include/rtl_*
sudo rm -rvf /usr/local/bin/rtl_*
sudo rm -rvf /lib/aarch64-linux-gnu/librtlsdr*
git clone https://github.com/VirusPilot/rtl-sdr.git
cd rtl-sdr
mkdir build
cd build
cmake ../ -DINSTALL_UDEV_RULES=ON
make
sudo make install
sudo ldconfig
