
# besides piaware this includes dump1090, fa-mlat-client, faup1090

wget https://flightaware.com/adsb/piaware/files/packages/pool/piaware/p/piaware-support/piaware-repository_4.0_all.deb
sudo dpkg -i piaware-repository_4.0_all.deb

sudo apt update
sudo apt install piaware

sudo piaware-config allow-auto-updates yes
sudo piaware-config allow-manual-updates yes

# if not already installed
sudo apt-get install dump1090-fa
sudo apt-get install dump978-fa