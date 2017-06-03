echo -e '\e[1m'============================'\e[0m'
echo -e '\e[1m'Raspberry P0 + WebService'\e[0m'
echo -e '\e[1m'============================'\e[0m'

# Enable ssh server
#raspi-config

echo -e '\e[1m' > Add autostatic repository'\e[0m'

wget -q -O - http://rpi.autostatic.com/autostatic.gpg.key | sudo apt-key add -
sudo wget -q -O /etc/apt/sources.list.d/autostatic-audio-raspbian.list http://rpi.autostatic.com/autostatic-audio-raspbian.list
sudo apt-get update

echo -e '\e[1m' > Install plugins'\e[0m'
echo -e '\e[1m' > - Guitarix <http://guitarix.org/>'\e[0m'
echo -e '\e[1m' > - Calf plugins <http://calf-studio-gear.org/>'\e[0m'
sudo apt-get install -y guitarix calf-plugins --no-install-recommends

echo -e '\e[1m' > Install dependencies'\e[0m'
cd /tmp
mkdir pedalpi
cd pedalpi

echo -e '\e[1m' >  - ModHost <https://github.com/moddevices/mod-host>'\e[0m'
sudo apt-get install -y libjack-jackd2-dev liblilv-dev libreadline-dev lilv-utils --no-install-recommends
git clone https://github.com/moddevices/mod-host
cd mod-host
make
sudo make install
cd ..

echo -e '\e[1m' >  - Pedal Pi dependencies'\e[0m'
mkdir pedalpi
cd pedalpi

echo -e '\e[1m' >    - pybonjour-python3 <https://github.com/depl0y/pybonjour-python3>'\e[0m'
pip3 install git+https://github.com/depl0y/pybonjour-python3

echo -e '\e[1m' >    - lilvlib <https://github.com/PedalPi/lilvlib>'\e[0m'
#sudo apt-get install libffi-dev -y --no-install-recommends
wget https://github.com/PedalPi/lilvlib/releases/download/v1.0.0/python3-lilv_0.22.1.git20160613_armhf.deb
sudo dpkg -i python3-lilv_0.22.1.git20160613_armhf.deb


echo -e '\e[1m' > PedalPi and components'\e[0m'
echo -e '\e[1m' >  - WebService <https://github.com/PedalPi/WebService>'\e[0m'
pip install PedalPi-WebService
echo -e '\e[1m' >  - Raspberry P0 <https://github.com/PedalPi/Raspberry-P0>'\e[0m'
pip install PedalPi-Raspberry-P0

cd ..
