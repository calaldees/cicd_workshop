DOCKER_IMAGE:=cicd_example
DOCKER_IMAGE_TEST:=cicd_test

build:
	docker build --tag ${DOCKER_IMAGE} .

run:
	docker run --rm -it --publish 8000:8000 ${DOCKER_IMAGE}

shell:
	docker run --rm -it --publish 8000:8000 --entrypoint /bin/sh ${DOCKER_IMAGE}

test:
	docker build --tag ${DOCKER_IMAGE_TEST} --target test .
	docker run --rm ${DOCKER_IMAGE_TEST}

