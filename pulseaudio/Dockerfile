FROM debian:bookworm

RUN apt update && apt install -y \
    alsa-utils \
    pulseaudio \
    && apt clean

COPY default.pa /etc/pulse/
