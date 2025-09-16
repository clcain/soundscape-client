up:
	docker compose down
	docker compose up -d

down:
	docker compose down

restart:
	docker compose restart

logs:
	docker compose logs -f

build:
	docker build ./pulseaudio -t clcain/pulseaudio
	docker build ./librespot -t clcain/librespot
	docker build ./shairport-sync -t clcain/shairport-sync
	docker build ./snapclient -t clcain/snapclient

buildx:
	docker buildx build ./pulseaudio -t clcain/pulseaudio --platform linux/amd64,linux/arm64,linux/arm/v7
	docker buildx build ./librespot -t clcain/librespot --platform linux/amd64,linux/arm64,linux/arm/v7
	docker buildx build ./shairport-sync -t clcain/shairport-sync --platform linux/amd64,linux/arm64,linux/arm/v7
	docker buildx build ./snapclient -t clcain/snapclient --platform linux/amd64,linux/arm64,linux/arm/v7

push-buildx:
	docker buildx build ./pulseaudio -t clcain/pulseaudio --platform linux/amd64,linux/arm64,linux/arm/v7 --push
	docker buildx build ./librespot -t clcain/librespot --platform linux/amd64,linux/arm64,linux/arm/v7 --push
	docker buildx build ./shairport-sync -t clcain/shairport-sync --platform linux/amd64,linux/arm64,linux/arm/v7 --push
	docker buildx build ./snapclient -t clcain/snapclient --platform linux/amd64,linux/arm64,linux/arm/v7 --push

push-tag-latest:
	docker buildx imagetools create -t clcain/pulseaudio:$(tag) clcain/pulseaudio:latest
	docker buildx imagetools create -t clcain/librespot:$(tag) clcain/librespot:latest
	docker buildx imagetools create -t clcain/shairport-sync:$(tag) clcain/shairport-sync:latest
	docker buildx imagetools create -t clcain/snapclient:$(tag) clcain/snapclient:latest

pull:
	docker compose pull

upgrade: pull up

clean:
	docker compose down -t 0
	docker compose rm -fv

.PHONY: *
