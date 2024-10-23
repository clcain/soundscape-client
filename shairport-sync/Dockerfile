FROM mikebrady/shairport-sync

COPY shairport-sync.conf /etc/

ENTRYPOINT /init
CMD /run.sh -o pa -a $DEVICE_NAME
