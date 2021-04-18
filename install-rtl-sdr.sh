#!/bin/bash
#set -x

sudo apt update
sudo apt install libusb-1.0-0-dev cmake git libtool -y

cd
sudo rm -rf rtl-sdr
git clone https://github.com/osmocom/rtl-sdr.git
cd rtl-sdr
mkdir build && cd build
cmake ../ -DENABLE_ZEROCOPY=0
make && make install && ldconfig
cd
sudo rm -rf rtl-sdr
