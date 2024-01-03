#!/bin/bash
#set -x

sudo apt update
sudo apt install git libusb-1.0-0-dev lighttpd build-essential fakeroot debhelper pkg-config libncurses5-dev -y

# compile and install librtlsdr from https://github.com/osmocom/rtl-sdr fork
cd
apt purge ^librtlsdr
rm -rf /root/rtl-sdr
rm -rf /usr/lib/librtlsdr*
rm -rf /usr/include/rtl-sdr*
rm -rf /usr/local/lib/librtlsdr*
rm -rf /usr/local/lib/aarch64-linux-gnu/librtlsdr*
rm -rf /usr/local/include/rtl-sdr*
rm -rf /usr/local/include/rtl_*
rm -rf /usr/local/bin/rtl_*
git clone https://github.com/VirusPilot/rtl-sdr.git
cd rtl-sdr
mkdir build
cd build
cmake ../ -DDETACH_KERNEL_DRIVER=ON -DINSTALL_UDEV_RULES=ON
make
sudo make install
sudo ldconfig

cd || exit
rm -rf dump1090
git clone https://github.com/VirusPilot/dump1090.git
cd dump1090 || exit
./prepare-build.sh bullseye
cd package-bullseye || exit
dpkg-buildpackage -b --no-sign --build-profiles=custom,rtlsdr
sudo dpkg -i ../dump1090-fa_*.deb
cd || exit
rm -rf dump1090
rm -f dump1090-fa*.*

echo
echo "Now the dump1090-fa config file needs to be edited, e.g. RECEIVER_SERIAL=1090, RECEIVER_LAT=50.000 and RECEIVER_LON=10.000"
echo
read -p "Press any key to continue"
sudo nano /etc/default/dump1090-fa
