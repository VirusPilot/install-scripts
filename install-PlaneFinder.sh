#!/bin/bash
#set -x

cd /root

wget http://client.planefinder.net/pfclient_4.1.1_armhf.deb
sudo dpkg -i pfclient_4.1.1_armhf.deb
