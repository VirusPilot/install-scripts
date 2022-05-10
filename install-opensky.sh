#!/bin/bash
#set -x

sudo apt update

ARCH=$(arch)
if [ $ARCH == aarch64 ]; then # arm64
    wget https://opensky-network.org/files/firmware/opensky-feeder_latest_arm64.deb
else # armhf
    wget https://opensky-network.org/files/firmware/opensky-feeder_latest_armhf.deb
fi
sudo dpkg -i *.deb
rm -f *.deb
