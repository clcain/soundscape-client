FROM debian:bookworm

  RUN apt update && apt install -y \
      alsa-utils \
      ffmpeg \
      mkchromecast \
      mkchromecast-alsa \
      mkchromecast-gstreamer \
      mkchromecast-pulseaudio \
      pulseaudio \
      && apt clean

ENTRYPOINT mkchromecast
