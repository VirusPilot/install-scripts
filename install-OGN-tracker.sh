#!/bin/bash
#set -x

cd /root
apt install python3-pip libffi-dev libssl-dev -y
pip install virtualenv

cd
git clone -b v4.1.2 --recursive https://github.com/espressif/esp-idf.git
cd esp-idf
./install.sh

cd components
git clone https://github.com/olikraus/u8g2.git

cd
git clone https://github.com/pjalocha/esp32-ogn-tracker.git
