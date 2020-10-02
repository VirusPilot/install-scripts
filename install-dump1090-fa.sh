#!/bin/bash
#set -x

cd /root
rm -rf /root/dump1090

apt install lighttpd build-essential debhelper librtlsdr-dev pkg-config dh-systemd libncurses5-dev libbladerf-dev libhackrf-dev liblimesuite-dev

git clone https://github.com/flightaware/dump1090.git
cd dump1090
dpkg-buildpackage -b --no-sign
dpkg -i ../dump1090-fa_*.deb
