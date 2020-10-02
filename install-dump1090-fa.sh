#!/bin/bash
#set -x

echo "install-rtl-sdr.sh needs to be run in advance"
read -p "Press return to continue"

cd /root
rm -rf /root/dump1090

apt install lighttpd build-essential debhelper librtlsdr-dev pkg-config dh-systemd libncurses5-dev libbladerf-dev libhackrf-dev liblimesuite-dev

git clone https://github.com/flightaware/dump1090.git
cd /root/dump1090
dpkg-buildpackage -b --no-sign
dpkg -i ../dump1090-fa_*.deb

echo "now the dump1090-fa config file needs to be edited"
read -p "Press return to continue"

nano /etc/default/dump1090-fa
