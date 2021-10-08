# Soundscape Client

A Snapcast client deployment through Docker that outputs syncrhonized audio playback across a TCP/IP network to Snapcast clients on your network. Also supports streaming using Airplay or Spotify Connect.

### Containers

- [Snapcast](https://github.com/badaix/snapcast)
- [shairport-sync](https://github.com/mikebrady/shairport-sync)
- [librespot](https://github.com/librespot-org/librespot)

### Usage

This is built for a Debian 10 system with the latest Docker and docker-compose installed. To use, simply run `docker-compose up` or use the handy script `bash start.sh`. An Airplay destination and a Spotify Connect player should appear on your network. If you experience connection difficulties, ensure that all host firewalls are turned off.

* Note: It will take several minutes to compile librespot on a Raspberry Pi. Please be patient; this added delay applies only to the first run. *

You must set the value of SOUNDSCAPE_SERVER in the .env file on this device to the hostname or IP address of the device running [Soundscape Server](https://github.com/clcain/soundscape-server). You may also give this device a unique name on your network using the DEVICE_NAME variable also located in the .env file.

Alternatively, you can manually install Snapcast server on any device on your network and use that device's IP address as the SOUNDSCAPE_SERVER address.
