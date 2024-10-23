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
	docker build ./librespot -t clcain/librespot
	docker build ./shairport-sync -t clcain/shairport-sync
	docker build ./snapclient -t clcain/snapclient

buildx:
	docker buildx build ./librespot -t clcain/librespot --platform linux/amd64,linux/arm64,linux/arm/v7
	docker buildx build ./shairport-sync -t clcain/shairport-sync --platform linux/amd64,linux/arm64,linux/arm/v7
	docker buildx build ./snapclient -t clcain/snapclient --platform linux/amd64,linux/arm64,linux/arm/v7

push-buildx:
	docker buildx build ./librespot -t clcain/librespot --platform linux/amd64,linux/arm64,linux/arm/v7 --push
	docker buildx build ./shairport-sync -t clcain/shairport-sync --platform linux/amd64,linux/arm64,linux/arm/v7 --push
	docker buildx build ./snapclient -t clcain/snapclient --platform linux/amd64,linux/arm64,linux/arm/v7 --push

clean:
	docker compose down -t 0
	docker compose rm -fv

.PHONY: *
