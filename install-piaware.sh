#!/bin/bash
#set -x

echo "besides piaware this includes dump1090, fa-mlat-client, faup1090, dump978"
read -p "Press return to continue"

cd /root
wget https://flightaware.com/adsb/piaware/files/packages/pool/piaware/p/piaware-support/piaware-repository_4.0_all.deb
sudo dpkg -i piaware-repository_4.0_all.deb

sudo apt update
sudo apt install piaware

sudo piaware-config allow-auto-updates yes
sudo piaware-config allow-manual-updates yes

echo "if not already separately installed, dump1090-fa will now be installed"
read -p "Press return to continue or exit (Ctrl-C)"

sudo apt-get install dump1090-fa
#sudo apt-get install dump978-fa