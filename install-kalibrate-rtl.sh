#!/bin/bash
#set -x

sudo apt update
sudo apt install libtool fftw3-dev -y

cd
sudo rm -rf kalibrate-rtl
git clone https://github.com/steve-m/kalibrate-rtl.git
cd kalibrate-rtl
./bootstrap && CXXFLAGS='-W -Wall -O3'
./configure
make && make install
cd
sudo rm -rf kalibrate-rtl
