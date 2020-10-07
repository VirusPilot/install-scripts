#!/bin/bash
#set -x

echo
echo "Please note: install-rtl-sdr.sh needs to be run in advance"
echo
read -p "Press any key to continue or exit (Ctrl-C)"

cd /root
rm -rf /root/kalibrate-rtl

apt install libtool fftw3-dev

git clone https://github.com/steve-m/kalibrate-rtl.git
cd /root/kalibrate-rtl
./bootstrap && CXXFLAGS='-W -Wall -O3'
./configure
make && make install
