#!/bin/bash
#set -x

sudo apt update
sudo apt install git libtool fftw3-dev -y

cd || exit
rm -rf kalibrate-rtl
git clone https://github.com/steve-m/kalibrate-rtl.git
cd kalibrate-rtl || exit
./bootstrap && CXXFLAGS='-W -Wall -O3'
./configure
make && make install
cd || exit
rm -rf kalibrate-rtl
