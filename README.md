# Soundscape Client

A Snapcast client deployment through Docker that outputs syncrhonized audio playback across a TCP/IP network to Snapcast clients on your network. It also supports streaming using Airplay or Spotify Connect.

## Containers

- [Snapcast](https://github.com/badaix/snapcast)
- [shairport-sync](https://github.com/mikebrady/shairport-sync)
- [librespot](https://github.com/librespot-org/librespot)

## Usage

This is built for a Debian 10 system with the latest Docker and docker-compose installed. To use, simply run `docker-compose up` or use `make up`. An Airplay destination and a Spotify Connect player should appear on your network. If you experience connection difficulties, ensure that all host firewalls are turned off.

*Note: It will take several minutes to compile librespot on a Raspberry Pi. Please be patient; this added delay applies only to the first run.*

## Configuration

All of the configuration paramters for a specific client are stored in the `.env` file.

Parameters include:

| Parameter         | Description                                      |
| ----------------- | ------------------------------------------------ |
| DEVICE_NAME       | The device name as it will appear on the network |
| SOUNDSCAPE_SERVER | The URL of the Soundscape Server instance        |
| SPOTIFY_USERNAME  | Your Spotify username                            |
| SPOTIFY_PASSWORD  | Your Spotify password                            |
