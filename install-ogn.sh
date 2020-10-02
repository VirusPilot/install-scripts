
# download and unpack version 0.2.8
cd
#wget http://download.glidernet.org/rpi-gpu/rtlsdr-ogn-bin-RPI-GPU-0.2.8.tgz # for Pi3
#wget http://download.glidernet.org/arm/rtlsdr-ogn-bin-ARM-0.2.8.tgz # for Pi4
tar xvzf *.tgz
rm *.tgz

cd rtlsdr-ogn
sudo chown root gsm_scan
sudo chmod a+s gsm_scan
sudo chown root ogn-rf
sudo chmod a+s  ogn-rf
sudo chown root rtlsdr-ogn
sudo chmod a+s  rtlsdr-ogn
sudo mknod gpu_dev c 100 0

cp -f Template.conf myPlace.conf
# - edit myPlace.conf, to set-up the receiver:
# - enter your crystal correction
# - GSM frequency for calibration, geographical position, APRS name
sudo nano myPlace.conf

sudo wget --no-check-certificate http://earth-info.nga.mil/GandG/wgs84/gravitymod/egm96/binary/WW15MGH.DAC

# install rtlsdr-ogn to run OGN receiver as a service
sudo cp -v rtlsdr-ogn /etc/init.d/rtlsdr-ogn
sudo cp -v rtlsdr-ogn.conf /etc/rtlsdr-ogn.conf
sudo update-rc.d rtlsdr-ogn defaults

# Update /etc/rtlsdr-ogn.conf according to name of your configuration file
# by replacing SampleConfigurationFileNameToChange.conf by the name of your config file (e.g. myPlace.conf)
# and pi with your actual username
sudo nano /etc/rtlsdr-ogn.conf
