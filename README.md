# Soundscape Client

A Snapcast client deployment using Docker that outputs syncrhonized audio playback across a TCP/IP network to Snapcast clients on your network. It also supports streaming using Airplay 2 and Spotify Connect.

## Containers

- [Snapcast](https://github.com/badaix/snapcast)
- [shairport-sync](https://github.com/mikebrady/shairport-sync)
- [librespot](https://github.com/librespot-org/librespot)

## Usage

This is built for a Debian system with the latest Docker and `docker compose` installed. To use, simply run `docker compose up -d` or use `make up`. An Airplay destination and a Spotify Connect player should appear on your network. If you experience connection difficulties, ensure that all host firewalls are turned off.

## Configuration

All of the configuration paramters for a specific client are stored in the `.env` file.

Parameters include:

| Parameter         | Description                                      |
| ----------------- | ------------------------------------------------ |
| DEVICE_NAME       | The device name as it will appear on the network |
| SOUNDSCAPE_SERVER | The URL of the Soundscape Server instance        |

The default sound device is configured in `default.pa`.

`aplay -L` may be used to list ALSA devices on your machine.
