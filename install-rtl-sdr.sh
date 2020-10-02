
sudo su
cd /root
rm -rf /root/rtl-sdr

apt install libusb-1.0-0-dev cmake git libtool

git clone https://github.com/osmocom/rtl-sdr.git
cd rtl-sdr
mkdir build && cd build
cmake ../ -DINSTALL_UDEV_RULES=ON -DDETACH_KERNEL_DRIVER=ON
make && make install && ldconfig
