# install-scripts

This is a collection of scripts to complement my other air-traffic related repositories, some of them are quite fundamental, some are optional.

## prepare
```
cd
sudo apt update
sudo apt install --yes git
git clone https://github.com/VirusPilot/install-scripts.git
```
## compile and install librtlsdr from https://github.com/osmocom/rtl-sdr
```
./install-scripts/install-rtl-sdr.sh
```

## dump1090-fa
source: https://github.com/flightaware/dump1090

This script installs the ADS-B decoder service which is required for ADS-B feeders like FlightAware, PlaneFinder, FlightRadar24, ADS-B Exchange and OpenSky.

```
./install-scripts/install-dump1090-fa.sh
```

## kalibrate-rtl
source: https://github.com/steve-m/kalibrate-rtl

This is a tool to determine the appropriate ppm value for the SDRs. In order to access the SDRs for this tool, all relevant processes like dump1090 need to be stopped.

```
./install-scripts/install-kalibrate-rtl.sh
```

## piaware
source: https://flightaware.com/adsb/piaware/install

This is the FlightAware setup suite that besides piaware installs dump1090, fa-mlat-client, faup1090 and dump978.

```
./install-scripts/install-piaware.sh
```

## PlaneFinder
source: https://forum.planefinder.net/threads/raspberry-pi-b-zero-rpi2-rpi3-rpi4-installation-instructions-for-raspbian-dump1090-data-feeder.241/

This is one of the popular ADS-B Feeders which is particularly interesting as it also displays traffic from the OGN network.

```
./install-scripts/install-PlaneFinder.sh
```

## OpenSky
source: https://opensky-network.org/community/projects/30-dump1090-feeder

This is a non-profit/research ADS-B Feeder which can also receive feeds from OGN stations
```
./install-scripts/install-opensky.sh
```

