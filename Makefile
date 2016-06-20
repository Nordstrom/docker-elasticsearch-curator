container_name := elasticsearch-curator
container_registry := quay.io/nordstrom
curator_version := 3.5.1
container_release := $(curator_version)

.PHONY: build/image tag/image push/image

build/image:
	docker build \
		--build-arg CURATOR_VERSION=$(curator_version) \
		-t $(container_name) .

tag/image: build/image
	docker tag $(container_name) $(container_registry)/$(container_name):$(container_release)

push/image: tag/image
	docker push $(container_registry)/$(container_name):$(container_release)
