#!/bin/bash
#set -x

sudo apt update

cd
wget http://client.planefinder.net/pfclient_5.1.440_arm64.deb
sudo dpkg -i *.deb
rm -f *.deb
