

empty=
space=$(empty) $(empty)
comma=","


ALL_ARCH = amd64 arm64 riscv64 s390x loongarch64
BUILDX_ARGS ?=

BUILDROOT_IMAGE ?= buildroot
BUILDROOT_TAG ?= latest
ALL_BUILDROOT=$(addprefix $(BUILDROOT_IMAGE):$(BUILDROOT_TAG)-,$(ALL_ARCH))

image-buildroot-arch-%:
	@echo Building for image-buildroot linux/$*
	@if [ "$*" = "loongarch64" ]; then \
		docker buildx build \
			--build-arg BUILDER_IMAGE=loongcr.lcpu.dev/lcpu/debian \
			--build-arg BUILDER_TAG=unstable-240513 \
			--platform linux/$* --no-cache \
			-f Dockerfile.buildroot -t $(BUILDROOT_IMAGE):$(BUILDROOT_TAG)-$* . $(BUILDX_ARGS); \
	else \
		docker buildx build \
			--build-arg BUILDER_IMAGE=debian \
			--build-arg BUILDER_TAG=unstable \
			--platform linux/$* --no-cache \
			-f Dockerfile.buildroot -t $(BUILDROOT_IMAGE):$(BUILDROOT_TAG)-$* . $(BUILDX_ARGS); \
	fi
	@docker push $(BUILDROOT_IMAGE):$(BUILDROOT_TAG)-$*

image-buildroot: $(addprefix image-buildroot-arch-,$(ALL_ARCH))
	@echo merage $(ALL_BUILDROOT)
	docker buildx imagetools create -t $(BUILDROOT_IMAGE):$(BUILDROOT_TAG) $(ALL_BUILDROOT)


DOCKERROOT_IMAGE ?= dockerroot
DOCKERROOT_TAG ?= latest
ALL_DOCKERROOT=$(addprefix buildroot:$(DOCKERROOT_TAG)-,$(ALL_ARCH))

image-dockerroot-%:
	@\
	echo Build docker-root: $* ; \
	docker buildx build \
		--build-arg BUILDER_IMAGE=${BUILDROOT_IMAGE} \
		--build-arg BUILDER_TAG=${BUILDROOT_TAG} \
		--build-arg DOCKERROOT=$* \
		--platform $(subst $(space),$(comma),$(addprefix linux/,$(ALL_ARCH))) --no-cache \
		-f Dockerfile.dockerroot -t $(DOCKERROOT_IMAGE):$(DOCKERROOT_TAG)-$* . $(BUILDX_ARGS);
	@docker push $(DOCKERROOT_IMAGE):$(DOCKERROOT_TAG)-$*
