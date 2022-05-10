#!/bin/bash
#set -x

sudo apt update
sudo apt install git libusb-1.0-0-dev lighttpd build-essential fakeroot debhelper pkg-config libncurses5-dev -y

ARCH=$(arch)
if [ $ARCH == aarch64 ]; then # arm64
    wget http://ftp.de.debian.org/debian/pool/main/r/rtl-sdr/librtlsdr0_0.6.0-4_arm64.deb
    wget http://ftp.de.debian.org/debian/pool/main/r/rtl-sdr/librtlsdr-dev_0.6.0-4_arm64.deb
    wget http://ftp.de.debian.org/debian/pool/main/r/rtl-sdr/rtl-sdr_0.6.0-4_arm64.deb
else # armhf
    wget http://ftp.de.debian.org/debian/pool/main/r/rtl-sdr/librtlsdr0_0.6.0-4_armhf.deb
    wget http://ftp.de.debian.org/debian/pool/main/r/rtl-sdr/librtlsdr-dev_0.6.0-4_armhf.deb
    wget http://ftp.de.debian.org/debian/pool/main/r/rtl-sdr/rtl-sdr_0.6.0-4_armhf.deb
fi
sudo dpkg -i *.deb
rm -f *.deb
sudo ldconfig

cd
rm -rf dump1090
git clone https://github.com/VirusPilot/dump1090.git
cd dump1090
./prepare-build.sh bullseye
cd package-bullseye
dpkg-buildpackage -b --no-sign --build-profiles=custom,rtlsdr
sudo dpkg -i ../dump1090-fa_*.deb
cd
rm -rf dump1090
rm -f dump1090-fa*.*

echo
echo "Now the dump1090-fa config file needs to be edited, e.g. --device-index and --ppm"
echo
read -p "Press any key to continue"
sudo nano /etc/default/dump1090-fa
