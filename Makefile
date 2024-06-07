

empty=
space=$(empty) $(empty)
comma=,


ALL_ARCH = amd64 arm64 riscv64 s390x loong64
BUILDX_ARGS ?=

BUILDROOT_IMAGE ?= qinka/buildroot
BUILDROOT_TAG ?= latest
ALL_BUILDROOT = $(addprefix $(BUILDROOT_IMAGE):$(BUILDROOT_TAG)-,$(ALL_ARCH))
BUILDROOT_DOWNLOAD_URL ?= https://buildroot.org/downloads/buildroot-${BUILDROOT_VERSION}.tar.gz

BASE_DEBIAN_IMAGE ?= qinka/base-debian
BASE_DEBIAN_TAG ?= unstable

LOONG_DEBIAN_IMAGE ?= qinka/base-debian-loongarch64
LOONG_DEBIAN_TAG ?= unstable-240513

.PHONY: sync-loong-debian base-debian-image image-buildroot FORCE
FORCE:

sync-loong-debian:
	docker buildx build --platform linux/loong64 \
		--build-arg LOONG_DEBIAN_IMAGE=$(LOONG_DEBIAN_IMAGE) \
		--build-arg LOONG_DEBIAN_TAG=$(LOONG_DEBIAN_TAG) \
		-f Dockerfile.debian-loong -t qinka/base-debian-loongarch64:$(LOONG_DEBIAN_TAG) $(BUILDX_ARGS) .
	docker push qinka/base-debian-loongarch64:$(LOONG_DEBIAN_TAG)

# sync-loong-debian:
# 	docker tag $(LOONG_DEBIAN_IMAGE):$(LOONG_DEBIAN_TAG) qinka/base-debian-loongarch64:$(LOONG_DEBIAN_TAG)
# 	docker push qinka/base-debian-loongarch64:$(LOONG_DEBIAN_TAG)


base-debian-image:
	docker buildx imagetools create -t $(BASE_DEBIAN_IMAGE):$(BASE_DEBIAN_TAG) debian:sid qinka/base-debian-loongarch64:$(LOONG_DEBIAN_TAG)

image-buildroot:
	@echo Building for image-buildroot linux/$*
	docker buildx build \
			--build-arg BUILDER_IMAGE=$(BASE_DEBIAN_IMAGE) \
			--build-arg BUILDER_TAG=$(BASE_DEBIAN_TAG) \
			--build-arg BUILDROOT_DOWNLOAD_URL=$(BUILDROOT_DOWNLOAD_URL) \
			--platform $(subst $(space),$(comma),$(addprefix linux/,$(ALL_ARCH))) --no-cache \
			-f Dockerfile.buildroot -t $(BUILDROOT_IMAGE):$(BUILDROOT_TAG) $(BUILDX_ARGS) .
	docker push $(BUILDROOT_IMAGE):$(BUILDROOT_TAG)-$*

# image-buildroot: $(addprefix image-buildroot-arch-,$(ALL_ARCH))
# 	@echo merage $(ALL_BUILDROOT)
# 	docker buildx imagetools create -t $(BUILDROOT_IMAGE):$(BUILDROOT_TAG) $(ALL_BUILDROOT)


DOCKERROOT_IMAGE ?= dockerroot
DOCKERROOT_TAG ?= latest
ALL_DOCKERROOT=$(addprefix buildroot:$(DOCKERROOT_TAG)-,$(ALL_ARCH))

image-dockerroot-%: FORCE
	@echo Build docker-root: $*
	docker buildx build \
		--build-arg BUILDER_IMAGE=${BUILDROOT_IMAGE} \
		--build-arg BUILDER_TAG=${BUILDROOT_TAG} \
		--build-arg DOCKERROOT=$* \
		--platform $(subst $(space),$(comma),$(addprefix linux/,$(ALL_ARCH))) --no-cache \
		-f Dockerfile.dockerroot -t $(DOCKERROOT_IMAGE)-$*:$(DOCKERROOT_TAG) $(BUILDX_ARGS) .
	docker push $(DOCKERROOT_IMAGE)-$*:$(DOCKERROOT_TAG)
