FROM debian:bookworm

RUN apt update && apt install -y \
    alsa-utils \
    ladspa-sdk \
    lsp-plugins \
    pulseaudio \
    swh-plugins \
    && apt clean

COPY default.pa /etc/pulse/
COPY eq.conf /

COPY entrypoint.sh /

ENTRYPOINT /entrypoint.sh
