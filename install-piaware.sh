#!/bin/bash
#set -x

echo
echo "Please note: besides PiAware, dump1090, fa-mlat-client, faup1090 and dump978 is included in this package"
echo
read -p "Press any key to continue"

cd
wget https://www.flightaware.com/adsb/piaware/files/packages/pool/piaware/f/flightaware-apt-repository/flightaware-apt-repository_1.2_all.deb
sudo *.deb
rm -f *.deb

sudo apt update
sudo apt install piaware

piaware-config allow-auto-updates yes
piaware-config allow-manual-updates yes

echo
echo "Please note: if not already previously installed, dump1090-fa will now be installed"
echo
read -p "Press any key to continue or exit (Ctrl-C)"

sudo apt install dump1090-fa
cd
