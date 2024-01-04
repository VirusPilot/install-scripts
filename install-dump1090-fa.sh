#!/bin/bash
#set -x

sudo apt update
sudo apt install git lighttpd build-essential fakeroot debhelper pkg-config libncurses5-dev -y

cd
git clone https://github.com/VirusPilot/dump1090.git
cd dump1090
sudo dpkg-buildpackage -b --no-sign --build-profiles=custom,rtlsdr
cd ..
sudo dpkg -i dump1090-fa_*.deb

echo
echo "Now the dump1090-fa config file needs to be edited, e.g. RECEIVER_SERIAL=1090, RECEIVER_LAT=50.000 and RECEIVER_LON=10.000"
echo
read -p "Press any key to continue"
sudo nano /etc/default/dump1090-fa
