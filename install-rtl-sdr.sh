#!/bin/bash
#set -x

sudo apt update
sudo apt install libusb-1.0-0-dev cmake git libtool -y

# remove previously (via the package manager) installed librtlsdr-dev
sudo apt purge librtlsdr*
sudo rm -rvf /usr/lib/librtlsdr* /usr/include/rtl-sdr* /usr/local/lib/librtlsdr* /usr/local/include/rtl-sdr*

# prevent kernel modules claiming use of the SDR
echo blacklist dvb_usb_rtl28xxu | sudo tee -a /etc/modprobe.d/rtl-sdr-blacklist.conf
echo blacklist dvb_usb_v2 | sudo tee -a /etc/modprobe.d/rtl-sdr-blacklist.conf
echo blacklist rtl2830 | sudo tee -a /etc/modprobe.d/rtl-sdr-blacklist.conf
echo blacklist rtl2832 | sudo tee /etc/modprobe.d/rtl-sdr-blacklist.conf
echo blacklist r820t | sudo tee -a /etc/modprobe.d/rtl-sdr-blacklist.conf
echo blacklist rtl8xxxu | sudo tee -a /etc/modprobe.d/rtl-sdr-blacklist.conf

cd || exit
rm -rf rtl-sdr
git clone https://github.com/osmocom/rtl-sdr.git
cd rtl-sdr || exit
mkdir build && cd build || exit
cmake ../ -DDETACH_KERNEL_DRIVER=ON -DINSTALL_UDEV_RULES=ON
make
sudo make install
sudo ldconfig
sudo make install-udev-rules
cd || exit
rm -rf rtl-sdr
