#!/bin/bash
#set -x

cd /root

wget http://client.planefinder.net/pfclient_5.0.161_armhf.deb
dpkg -i pfclient_5.0.161_armhf.deb
