REPO_ROOT := $(CURDIR)
APP_NAME ?= "helloworld.py"

.PHONY: unit
unit:

	hack/run_tests.sh

.PHONY: test
test: unit

.PHONY: coverage
coverage: echo

.Phony: lint
lint:

	black app/helloworld/

.PHONY: ci-lint
ci-lint:

	black --check app/helloworld/

.PHONY: build-install-manifest
build-install-manifest:

	hack/build-single-manifest.sh

.PHONY: compare-install-manifest
compare-install-manifest:

	hack/compare-single-manifest.sh