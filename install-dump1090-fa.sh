#!/bin/bash
#set -x

echo
echo "Please note: install-rtl-sdr.sh needs to be run in advance"
echo
read -p "Press any key to continue or exit (Ctrl-C)"

cd /root
rm -rf /root/dump1090

apt install lighttpd build-essential debhelper librtlsdr-dev pkg-config dh-systemd libncurses5-dev libbladerf-dev libhackrf-dev liblimesuite-dev -y

git clone https://github.com/flightaware/dump1090.git
cd /root/dump1090
dpkg-buildpackage -b --no-sign
dpkg -i ../dump1090-fa_*.deb

echo
echo "Now the dump1090-fa config file needs to be edited, e.g. --device-index and --ppm"
echo
read -p "Press any key to continue"

nano /etc/default/dump1090-fa
