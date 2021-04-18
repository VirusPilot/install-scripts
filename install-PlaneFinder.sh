#!/bin/bash
#set -x

sudo apt update

cd
wget http://client.planefinder.net/pfclient_5.0.161_armhf.deb
dpkg -i pfclient_5.0.161_armhf.deb
rm -f pfclient_5.0.161_armhf.deb
