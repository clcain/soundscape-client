#!/bin/bash

if [ -z "$DEVICE_NAME" ]
then
    echo "DEVICE_NAME not defined."
    exit 1
fi

if [ -z "$SNAPSERVER_ADDR" ]
then
    echo "SNAPSERVER_ADDR not defined."
    exit 1
fi

echo "Starting snapclient..."

snapclient \
    --player pulse \
    --hostID "$DEVICE_NAME" \
    --host "$SNAPSERVER_ADDR"
