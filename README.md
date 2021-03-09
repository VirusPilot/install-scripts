# install-scripts

This is a collection of scripts to complement my other air-traffic related repositories, some of them are quite fundamental, some are optional.

## prepare
```
login as user pi
sudo su
cd
apt update
apt install --yes git
git clone https://github.com/VirusPilot/install-scripts.git
```

## OGN Tracker (intended to be installed on top of a Stratux Europe Edition)
source: https://github.com/pjalocha/esp32-ogn-tracker

```
./install-scripts/install-OGN-tracker
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

```
./install-scripts/install-rtl-sdr
```

## dump1090-fa
source: https://github.com/flightaware/dump1090

This is required for ADS-B feeders like FlightAware, PlaneFinder, FlightRadar24, ADS-B Exchange.

```
./install-scripts/install-dumo1090-fa
```

## kalibrate-rtl
source: https://github.com/steve-m/kalibrate-rtl

This is a tool to determine the appropriate ppm value for the SDRs. In order to access the SDRs for this tool, all relevant processes like dump1090 need to be stopped.

```
./install-scripts/install-kalibrate-rtl
```

## piaware
source: https://flightaware.com/adsb/piaware/install

This is the FlightAware setup suite that besides piaware installs dump1090, fa-mlat-client, faup1090 and dump978.

```
./install-scripts/install-piaware
```

## PlaneFinder
source: https://forum.planefinder.net/threads/raspberry-pi-b-zero-rpi2-rpi3-rpi4-installation-instructions-for-raspbian-dump1090-data-feeder.241/

This is one of the popular ADS-B Feeders which is particularly interesting as it also displays traffic from the OGN network.

```
./install-scripts/install-PlaneFinder
```
