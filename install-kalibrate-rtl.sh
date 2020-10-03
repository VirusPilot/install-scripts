#!/bin/bash
#set -x

echo
echo "install-rtl-sdr.sh needs to be run in advance"
read -p "Press return to continue"
echo

cd /root
rm -rf /root/kalibrate-rtl

apt install libtool fftw3-dev

git clone https://github.com/steve-m/kalibrate-rtl.git
cd /root/kalibrate-rtl
./bootstrap && CXXFLAGS='-W -Wall -O3'
./configure
make && make install
