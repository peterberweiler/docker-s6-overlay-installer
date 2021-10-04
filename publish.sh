#!/bin/sh

if [ ! $# -eq 2 ]; then
  echo "Usage:"
  echo "    ./publish.sh <S6_OVERLAY_VERSION> <DOCKER_IMAGE_VERSION>"
  echo ""
  echo "Example Usage:"
  echo "    ./publish.sh v2.2.0.3 v2.2.0.3"
  echo ""
  echo "    ./publish.sh v2.2.0.3 latest"    
else
  S6_OVERLAY_VERSION=$1
  DOCKER_IMAGE_VERSION=$2

  docker buildx build \
    --platform linux/amd64,linux/arm64,linux/riscv64,linux/ppc64le,linux/s390x,linux/386,linux/arm/v7,linux/arm/v6,linux/mips64le,linux/mips64 \
    --build-arg S6_OVERLAY_VERSION=${S6_OVERLAY_VERSION} \
    --target installer-image \
    --tag peterberweiler/s6-overlay-installer:${DOCKER_IMAGE_VERSION} \
    --push .
fi






