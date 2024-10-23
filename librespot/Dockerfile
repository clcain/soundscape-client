FROM debian:bookworm

RUN apt update && apt install -y \
    alsa-utils \
    avahi-daemon \
    build-essential \
    cmake \
    libasound2-dev \
    libclang-dev \
    libpulse-dev \
    pkg-config \
    wget \
    && apt clean

RUN wget -O - https://sh.rustup.rs | sh -s -- -y
RUN . $HOME/.cargo/env && cargo install librespot --features "alsa-backend pulseaudio-backend" && ln -s /root/.cargo/bin/librespot /usr/local/bin/

COPY entrypoint.sh /

ENTRYPOINT /entrypoint.sh
