# install-scripts

This is a collection of scripts to complement my other air-traffic related repositories, some of them are quite fundamental, some are optional.

## prepare
```
sudo su
apt update
sudo apt install --yes git
git clone https://github.com/VirusPilot/install-scripts.git
```
## example: setting up a unified traffic map for your local airport controller including a FlightAware feed

based on https://github.com/b3nn0/ogn2dump1090
```
sudo su
apt update
apt install --yes git
git clone https://github.com/b3nn0/ogn2dump1090.git
cd ogn2dump1090
./install.sh

(automatic reboot)

sudo su
./install-scripts/install-piaware (please skip the dump1090 install at the end of the script)
```
Now you should see all ADS-B and OGN traffic on one unified map, OGN will be displayed as MLAT: http://raspberrypi/dump1090-fa/.

Furthermore you may register your FlightAware feeder client here: https://flightaware.com/adsb/piaware/claim.

## OGN Tracker (intended to be installed on top of a Stratux Europe Edition)
source: https://github.com/pjalocha/esp32-ogn-tracker

```
cd esp32-ogn-tracker
nano main/config.h (enable/disable certain features like OLED or WiFi)
source ~/esp-idf/export.sh (build preparation)
stxstop (in case the tracker is connected to Stratux)
make (just compiling)
make flash (compiling and flashing)
```

## rtl-sdr
source: https://github.com/osmocom/rtl-sdr

This is the most fundamental one which is required for all other SDR based applications.

## dump1090-fa
source: https://github.com/flightaware/dump1090

This is required for ADS-B feeders like FlightAware, PlaneFinder, FlightRadar24, ADS-B Exchange.

## kalibrate-sdr
source: https://github.com/steve-m/kalibrate-rtl

This is a tool to determine the appropriate ppm value for the SDRs. In order to access the SDRs for this tool, all relevant processes like dump1090 need to be stopped.

## piaware
source: https://flightaware.com/adsb/piaware/install

This is the FlightAware setup suite that besides piaware installs dump1090, fa-mlat-client, faup1090 and dump978.

## PlaneFinder
source: https://forum.planefinder.net/threads/raspberry-pi-b-zero-rpi2-rpi3-rpi4-installation-instructions-for-raspbian-dump1090-data-feeder.241/

This is one of the popular ADS-B Feeders which is particularly interesting as it also displays traffic from the OGN network.
