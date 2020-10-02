#!/bin/bash
#set -x

cd /root
rm -rf /root/kalibrate-rtl

git clone https://github.com/steve-m/kalibrate-rtl.git
cd /root/kalibrate-rtl
./bootstrap && CXXFLAGS='-W -Wall -O3'
./configure
make && make install
