#!/bin/bash

if [ -z "$DEVICE_NAME" ]
then
    echo "DEVICE_NAME not defined."
    exit 1
fi

if [ -z "$SOUNDSCAPE_SERVER" ]
then
    echo "SOUNDSCAPE_SERVER not defined."
    exit 1
fi

echo "Starting snapclient..."

snapclient --hostID "$DEVICE_NAME" --host "$SOUNDSCAPE_SERVER"
