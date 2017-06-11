C='\033[1m'
NC='\033[0m'

echo ${C}============================${NC}
echo ${C}Raspberry P0 + WebService${NC}
echo ${C}============================${NC}

echo ${C}' > Add autostatic repository'${NC}


echo -e ${C}============================${NC}
echo -e ${C}Raspberry P0 + WebService${NC}
echo -e ${C}============================${NC}

# Enable ssh server
#raspi-config

echo -e ${C}' > Add autostatic repository'${NC}

wget -q -O - http://rpi.autostatic.com/autostatic.gpg.key | sudo apt-key add -
sudo wget -q -O /etc/apt/sources.list.d/autostatic-audio-raspbian.list http://rpi.autostatic.com/autostatic-audio-raspbian.list
sudo apt-get update

echo -e ${C}' > Install plugins'${NC}
echo -e ${C}' > - Guitarix <http://guitarix.org/>'${NC}
echo -e ${C}' > - Calf plugins <http://calf-studio-gear.org/>'${NC}
sudo apt-get install -y guitarix calf-plugins --no-install-recommends

echo -e ${C}' > Install dependencies'${NC}
cd /tmp
mkdir pedalpi
cd pedalpi

echo -e ${C}' >  - ModHost <https://github.com/moddevices/mod-host>'${NC}
sudo apt-get install -y libjack-jackd2-dev liblilv-dev libreadline-dev lilv-utils --no-install-recommends
git clone https://github.com/moddevices/mod-host
cd mod-host
make
sudo make install
cd ..

echo -e ${C}' >  - Pedal Pi dependencies'${NC}
mkdir pedalpi
cd pedalpi

echo -e ${C}' >    - pybonjour-python3 <https://github.com/depl0y/pybonjour-python3>'${NC}
pip3 install git+https://github.com/depl0y/pybonjour-python3

echo -e ${C}' >    - lilvlib <https://github.com/PedalPi/lilvlib>'${NC}
#sudo apt-get install libffi-dev -y --no-install-recommends
wget https://github.com/PedalPi/lilvlib/releases/download/v1.0.0/python3-lilv_0.22.1.git20160613_armhf.deb
sudo dpkg -i python3-lilv_0.22.1.git20160613_armhf.deb


echo -e ${C}' > PedalPi and components'${NC}
echo -e ${C}' >  - WebService <https://github.com/PedalPi/WebService>'${NC}
pip install PedalPi-WebService
echo -e ${C}' >  - Raspberry P0 <https://github.com/PedalPi/Raspberry-P0>'${NC}
pip install PedalPi-Raspberry-P0

cd ..
