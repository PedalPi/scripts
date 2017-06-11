# Scripts

## Raspberry P0 + WebService

This scripts contains the **components**:

 * [Raspberry P0](https://github.com/PedalPi/Raspberry-P0)
 * [WebService](https://github.com/PedalPi/WebService)

It has tested in **Raspbian Jessie with Pixel**
 - Version: April 2017
 - Release date: 2017-04-10

### Script

```bash
wget https://raw.githubusercontent.com/PedalPi/scripts/master/RaspberryP0%2Bwebservice.sh
sh RaspberryP0+webservice.sh 
```

### Execute

```bash
# Start jackd, like:
#jackd -R -P70 -t2000 -dalsa -dhw:1 -p256 -n3 -r44100 -s &
mod-host
python3 ~/Desktop/pedalpi.py
```
