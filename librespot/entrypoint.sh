#!/bin/bash

if [ -z "$DEVICE_NAME" ]
then
    echo "DEVICE_NAME not defined."
    exit 1
fi

echo "Starting librespot..."

librespot \
    --backend pulseaudio \
    --name "$DEVICE_NAME" \
    --cache /var/cache/librespot \
    --enable-volume-normalisation \
    --volume-ctrl cubic \
    --bitrate 320 \
    --initial-volume=25
