
######## the following architectures are tested ########

FROM scratch as base-amd64
ARG S6_OVERLAY_ARCH="amd64"

FROM scratch as base-armv7
ARG S6_OVERLAY_ARCH="arm"

######## the following architectures are untested ########

FROM scratch as base-arm64
ARG S6_OVERLAY_ARCH="armhf"

FROM scratch as base-ppc64le
ARG S6_OVERLAY_ARCH="ppc64le"

FROM scratch as base-armv6
ARG S6_OVERLAY_ARCH="arm"

FROM scratch as base-riscv64
ARG S6_OVERLAY_ARCH="arm"

FROM scratch as base-mips64le
ARG S6_OVERLAY_ARCH="arm"

FROM scratch as base-mips64
ARG S6_OVERLAY_ARCH="arm"

FROM scratch as base-s390x
ARG S6_OVERLAY_ARCH="amd64"

FROM scratch as base-386
ARG S6_OVERLAY_ARCH="amd64"



FROM base-${TARGETARCH}${TARGETVARIANT} as installer-image

ARG S6_OVERLAY_VERSION

ADD https://github.com/just-containers/s6-overlay/releases/download/${S6_OVERLAY_VERSION}/s6-overlay-${S6_OVERLAY_ARCH}-installer /installer


