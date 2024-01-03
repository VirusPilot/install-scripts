#!/bin/bash
#set -x

sudo apt update
sudo apt install libusb-1.0-0-dev cmake git libtool -y

cd
apt purge ^librtlsdr
rm -rf /root/rtl-sdr
rm -rf /usr/lib/librtlsdr*
rm -rf /usr/include/rtl-sdr*
rm -rf /usr/local/lib/librtlsdr*
rm -rf /usr/local/lib/aarch64-linux-gnu/librtlsdr*
rm -rf /usr/local/include/rtl-sdr*
rm -rf /usr/local/include/rtl_*
rm -rf /usr/local/bin/rtl_*
git clone https://github.com/VirusPilot/rtl-sdr.git
cd rtl-sdr
mkdir build
cd build
cmake ../ -DDETACH_KERNEL_DRIVER=ON -DINSTALL_UDEV_RULES=ON
make
sudo make install
sudo ldconfig
