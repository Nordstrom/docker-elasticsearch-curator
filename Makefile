image_name := elasticsearch-curator
image_registry := quay.io/nordstrom
curator_version := 3.5.1
image_release := $(curator_version)

build_args := --build-arg CURATOR_VERSION=$(curator_version)

ifdef http_proxy
build_args += --build-arg http_proxy=$(http_proxy)
build_args += --build-arg https_proxy=$(http_proxy)
endif

.PHONY: build/image tag/image push/image

build/image:
	docker build -t $(image_name) $(build_args) .

tag/image: build/image
	docker tag $(image_name) $(image_registry)/$(image_name):$(image_release)

push/image: tag/image
	docker push $(image_registry)/$(image_name):$(image_release)
