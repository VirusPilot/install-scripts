#!/bin/bash
#set -x

sudo apt update

ARCH=$(getconf LONG_BIT)
if [[ $ARCH -eq 64 ]]; then
    wget https://opensky-network.org/files/firmware/opensky-feeder_latest_arm64.deb
else
    wget https://opensky-network.org/files/firmware/opensky-feeder_latest_armhf.deb
fi
sudo dpkg -i *.deb
rm -f *.deb
