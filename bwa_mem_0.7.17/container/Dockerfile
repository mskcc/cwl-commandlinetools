FROM ubuntu:16.04

LABEL maintainer="Ian Johnson (johnsoni@mskcc.org)" \
      version.image="0.1.0" \
      version.bwa="0.7.17" \
      version.ubuntu="16.04" \
      source.bwa="https://github.com/lh3/bwa/releases/tag/v0.7.17"

ENV BWA_VERSION 0.7.17

RUN apt-get -y update \
      # install build tools and dependencies
            && apt-get -y install build-essential zlib1g-dev wget unzip \
      # download and unzip bwa
            && cd /tmp && wget "https://github.com/lh3/bwa/archive/v${BWA_VERSION}.zip" \
            && unzip "v${BWA_VERSION}.zip" \
      # build
            && cd "/tmp/bwa-${BWA_VERSION}" \
            && make \
      # move binaries to /usr/bin
            && mv "/tmp/bwa-${BWA_VERSION}/bwa" /usr/bin \
      # clean up
            && rm -rf /tmp/*
