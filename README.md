# Soundscape Client

Turn your Linux device into a smart speaker and easily create a synchronized multi-room audio system with Soundscape!

The following audio sources are supported:

- Snapcast
- Airplay 2
- Spotify Connect

## Containers

- [Snapcast](https://github.com/badaix/snapcast)
- [shairport-sync](https://github.com/mikebrady/shairport-sync)
- [librespot](https://github.com/librespot-org/librespot)

## Usage

Soundscape is built for a Debian/Raspbian system with the latest Docker and `docker compose` installed. To use, simply run `make up` or `docker compose up -d`.

## Configuration

All of the configuration paramters for a specific client are stored in the `.env` file.

Parameters include:

| Parameter         | Description                                      |
| ----------------- | ------------------------------------------------ |
| DEVICE_NAME       | The device name as it will appear on the network |
| SNAPSERVER_ADDR   | The address of the snapserver instance           |

The default sound device is configured in [default.pa](./pulseaudio/default.pa).

`aplay -L` may be used to list ALSA devices on your machine.

### Equalization

Soundscape includes a built-in EQ for the client device. To use it, edit [eq.conf](./pulseaudio/eq.conf)

Run `make up` to apply changes.
