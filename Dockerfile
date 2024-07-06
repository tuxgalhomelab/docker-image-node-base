# syntax=docker/dockerfile:1

ARG BASE_IMAGE_NAME
ARG BASE_IMAGE_TAG
FROM ${BASE_IMAGE_NAME}:${BASE_IMAGE_TAG}

SHELL ["/bin/bash", "-c"]

ARG NVM_VERSION
ARG NVM_SHA256_CHECKSUM
ARG IMAGE_NODEJS_VERSION

# hadolint ignore=SC1091
RUN \
    set -E -e -o pipefail \
    && homelab install-tar-dist \
        https://github.com/nvm-sh/nvm/archive/refs/tags/${NVM_VERSION:?}.tar.gz \
        ${NVM_SHA256_CHECKSUM:?} \
        nvm \
        nvm-${NVM_VERSION#"v"} \
        root \
        root \
    && source "/opt/nvm/nvm.sh" \
    && nvm install ${IMAGE_NODEJS_VERSION:?} \
    # Clean up. \
    && homelab cleanup

ENV NVM_DIR="/opt/nvm"
