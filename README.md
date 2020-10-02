# install-scripts

This is a collection of scripts to complement my other air-traffic related repositories, some of them are quite fundamental, some are optional

## usage examples
```
sudo su
cd /home
apt update
./install-scripts/install-rtl-sdr
./install-scripts/install-dump1090-fa
...
```
## rtl-sdr
source: https://github.com/osmocom/rtl-sdr

This is the most fundamental one which is the basis for all other SDR based applications

## dump1090-fa
source: https://github.com/flightaware/dump1090

This is the basis for the most popular ADS-B feeders like SkyAware, PlaneFinder, FlightRadar24

## kalibrate-sdr
source: https://github.com/steve-m/kalibrate-rtl

This is a tool to aquire the appropriate ppm setting for the SDRs. In order to access the SDRs, all relevant processes like dump1090 need to be stopped.

## piaware
source: https://flightaware.com/adsb/piaware/install

This is a full setup suite that besides piaware installs dump1090, fa-mlat-client, faup1090, dump978

## PlaneFinder
source: https://forum.planefinder.net/threads/raspberry-pi-b-zero-rpi2-rpi3-rpi4-installation-instructions-for-raspbian-dump1090-data-feeder.241/

This is one of the popular ADS-B Feeders which is particularly interesting as it also displays traffic from the OGN network
