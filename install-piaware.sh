#!/bin/bash
#set -x

echo
echo "Please note: besides PiAware, dump1090, fa-mlat-client, faup1090 and dump978 is included in this package"
echo
read -p "Press any key to continue"

sudo apt update

cd
wget https://flightaware.com/adsb/piaware/files/packages/pool/piaware/p/piaware-support/piaware-repository_5.0_all.deb
dpkg -i piaware-repository_5.0_all.deb
rm -f piaware-repository_5.0_all.deb

sudo apt install piaware

piaware-config allow-auto-updates yes
piaware-config allow-manual-updates yes

echo
echo "Please note: if not already previously installed, dump1090-fa will now be installed"
echo
read -p "Press any key to continue or exit (Ctrl-C)"

sudo apt install dump1090-fa
cd
