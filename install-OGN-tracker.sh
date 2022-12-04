#!/bin/bash
#set -x

cd /root
apt update
apt install virtualenv -y

cd
git clone -b v4.3 --recursive https://github.com/espressif/esp-idf.git
cd esp-idf
./install.sh

cd components
git clone https://github.com/olikraus/u8g2.git

cd
git clone https://github.com/pjalocha/esp32-ogn-tracker.git
