#!/bin/bash
#set -x

echo
echo "Please note: besides PiAware, dump1090, fa-mlat-client, faup1090 and dump978 is included in this package"
echo
read -p "Press any key to continue"

cd /root
wget https://flightaware.com/adsb/piaware/files/packages/pool/piaware/p/piaware-support/piaware-repository_4.0_all.deb
sudo dpkg -i piaware-repository_4.0_all.deb

sudo apt update
sudo apt install piaware

sudo piaware-config allow-auto-updates yes
sudo piaware-config allow-manual-updates yes

echo
echo "Please note: if not already previously installed, dump1090-fa will now be installed"
echo
read -p "Press any key to continue or exit (Ctrl-C)"

sudo apt-get install dump1090-fa
