DOCKER_IMAGE:=cicd_example
DOCKER_IMAGE_TEST:=cicd_test

build:
	docker build --tag ${DOCKER_IMAGE} .

run:
	docker run --rm -it --publish 8000:8000 ${DOCKER_IMAGE}

build_test:
	docker build --tag ${DOCKER_IMAGE_TEST} --target test .

test: build_test
	docker run --rm ${DOCKER_IMAGE_TEST}

shell: build_test
	docker run --rm -it \
		--publish 8000:8000 \
		--volume ${PWD}:/app/ \
		--entrypoint /bin/sh \
		${DOCKER_IMAGE_TEST}
