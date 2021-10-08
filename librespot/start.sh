#!/bin/bash

SPOTIFY_CREDENTIALS=""

if [ ! -z "$SPOTIFY_USERNAME" ] & [ ! -z "$SPOTIFY_PASSWORD" ]
then
    echo "Using Spotify credentials."
    SPOTIFY_CREDENTIALS="--username $SPOTIFY_USERNAME --password $SPOTIFY_PASSWORD"
fi

echo "Starting librespot..."

librespot --name "$DEVICE_NAME" $SPOTIFY_CREDENTIALS --cache /var/cache/librespot --enable-volume-normalisation --volume-ctrl linear --bitrate 320 --initial-volume=25
