# Help Generation --------------------------------------------------------------
.PHONY: help
.DEFAULT_GOAL:=help
help:	## display this help
	@awk 'BEGIN {FS = ":.*##"; printf "\nUsage:\n  make \033[36m<target>\033[0m\n\nTargets:\n"} /^[a-zA-Z_-]+:.*?##/ { printf "  \033[36m%-8s\033[0m %s\n", $$1, $$2 } END{print ""}' $(MAKEFILE_LIST)

# Variables --------------------------------------------------------------------

DOCKER_IMAGE:=cicd_example
DOCKER_IMAGE_TEST:=cicd_test

# Local Targets ----------------------------------------------------------------

build:	##
	docker build --tag ${DOCKER_IMAGE} .

run:	##
	docker run --rm -it --publish 8000:8000 ${DOCKER_IMAGE}

build_test:	##
	docker build --tag ${DOCKER_IMAGE_TEST} --target test .

test: build_test	##
	docker run --rm ${DOCKER_IMAGE_TEST} black . --check
	docker run --rm ${DOCKER_IMAGE_TEST} pytest \
		--cov-fail-under $$(cat pytest.cov-fail-under)

shell: build_test	##
	docker run --rm -it \
		--publish 8000:8000 \
		--volume ${PWD}:/app/:rw \
		--entrypoint /bin/bash \
		${DOCKER_IMAGE_TEST}

# Container Targets ------------------------------------------------------------

update_cov-fail-under:	##
	pytest --cov-report=html:/tmp/cov.html
	grep 'pc_cov' /tmp/cov.html/index.html | sed 's/[^0-9.]*//g' > pytest.cov-fail-under
	# Updated coverage requirement to
	cat pytest.cov-fail-under
