#!/bin/bash
#set -x

sudo apt update
sudo apt install lighttpd build-essential debhelper pkg-config dh-systemd libncurses5-dev libbladerf-dev libhackrf-dev liblimesuite-dev -y

cd
rm -rf dump1090
git clone https://github.com/VirusPilot/dump1090.git
cd dump1090
dpkg-buildpackage -b --no-sign
sudo dpkg -i ../dump1090-fa_*.deb
