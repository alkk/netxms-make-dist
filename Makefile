.PHONY: all build_local build_and_push clean

REVISION ?= master

IMAGE_REVISION = 1.1

all: build_local
	docker run --rm -v $(PWD)/dist:/dist netxms-make-dist:$(IMAGE_REVISION) $(REVISION)

build_local:
	docker build -t netxms-make-dist:$(IMAGE_REVISION) .

build_and_push:
	docker buildx build --platform=linux/amd64,linux/arm64 -t ghcr.io/netxms/make-dist:$(IMAGE_REVISION) -t ghcr.io/netxms/make-dist:latest -o type=registry .

clean:
	docker rmi -f netxms-make-dist:$(IMAGE_REVISION)
	docker rmi -f netxms-make-dist:local
	rm -rf dist
