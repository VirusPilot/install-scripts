#!/bin/bash
#set -x

cd /root || exit
apt update
apt install virtualenv git -y

cd || exit
git clone -b v4.3 --recursive https://github.com/espressif/esp-idf.git
cd esp-idf || exit
./install.sh

cd components || exit
git clone https://github.com/olikraus/u8g2.git

cd || exit
git clone https://github.com/pjalocha/esp32-ogn-tracker.git
