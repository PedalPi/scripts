C='\033[1m'
NC='\033[0m'

echo ${C}============================${NC}
echo ${C}Raspberry P0 + WebService${NC}
echo ${C}============================${NC}

echo ${C}' > Add autostatic repository'${NC}


echo ${C}============================${NC}
echo ${C}Raspberry P0 + WebService${NC}
echo ${C}============================${NC}

# Enable ssh server
#raspi-config

echo ${C}' > Add autostatic repository'${NC}

wget -q -O - http://rpi.autostatic.com/autostatic.gpg.key | sudo apt-key add -
sudo wget -q -O /etc/apt/sources.list.d/autostatic-audio-raspbian.list http://rpi.autostatic.com/autostatic-audio-raspbian.list
sudo apt-get update

echo ${C}' > Install plugins'${NC}
echo ${C}' > - Guitarix <http://guitarix.org/>'${NC}
echo ${C}' > - Calf plugins <http://calf-studio-gear.org/>'${NC}
sudo apt-get install -y guitarix calf-plugins --no-install-recommends

echo ${C}' > Install dependencies'${NC}
cd /tmp
mkdir pedalpi
cd pedalpi

echo ${C}' >  - ModHost <https://github.com/moddevices/mod-host>'${NC}
sudo apt-get install -y libjack-jackd2-dev liblilv-dev libreadline-dev lilv-utils --no-install-recommends
git clone https://github.com/moddevices/mod-host
cd mod-host
make
sudo make install
cd ..

echo ${C}' >  - Pedal Pi dependencies'${NC}
mkdir pedalpi
cd pedalpi

echo ${C}' >    - pybonjour-python3 <https://github.com/depl0y/pybonjour-python3>'${NC}
sudo apt-get install libavahi-compat-libdnssd1
pip3 install git+https://github.com/depl0y/pybonjour-python3

echo ${C}' >    - lilvlib <https://github.com/PedalPi/lilvlib>'${NC}
sudo apt-get install libffi-dev -y --no-install-recommends
wget https://github.com/PedalPi/lilvlib/releases/download/v1.0.0/python3-lilv_0.22.1.git20160613_armhf.deb
sudo dpkg -i python3-lilv_0.22.1.git20160613_armhf.deb


echo ${C}' > PedalPi and components'${NC}
sudo apt-get install libportaudio0 libportaudio2 libportaudiocpp0 portaudio19-dev
echo ${C}' >  - WebService <https://github.com/PedalPi/WebService>'${NC}
pip3 install PedalPi-WebService --user
echo ${C}' >  - Raspberry P0 <https://github.com/PedalPi/Raspberry-P0>'${NC}
pip3 install PedalPi-Raspberry-P0 --user

cd ..
