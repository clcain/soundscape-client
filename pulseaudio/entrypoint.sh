#!/bin/bash

/equalizer.sh
pulseaudio --exit-idle-time=-1 --load="module-native-protocol-tcp auth-ip-acl=127.0.0.1 auth-anonymous=1"
