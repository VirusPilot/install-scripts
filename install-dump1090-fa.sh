#!/bin/bash
#set -x

sudo apt update
sudo apt install librtlsdr-dev libusb-1.0-0-dev lighttpd build-essential debhelper pkg-config libncurses5-dev libbladerf-dev libhackrf-dev liblimesuite-dev -y

cd
rm -rf dump1090
git clone -b dev https://github.com/flightaware/dump1090.git
cd dump1090
dpkg-buildpackage -b --no-sign
sudo dpkg -i ../dump1090-fa_*.deb
cd
rm -rf dump1090
rm -f dump1090-fa*.*

echo
echo "Now the dump1090-fa config file needs to be edited, e.g. --device-index and --ppm"
echo
read -p "Press any key to continue"
sudo nano /etc/default/dump1090-fa
