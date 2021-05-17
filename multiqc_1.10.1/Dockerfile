################## BASE IMAGE ######################

FROM python:3.6-slim

################## ARGUMENTS/Environments ##########

ARG BUILD_DATE
ARG BUILD_VERSION
ARG LICENSE="Apache-2.0"
ARG MULTIQC_VERSION
ARG VCS_REF
################## METADATA ########################
LABEL org.opencontainers.image.vendor="MSKCC"
LABEL org.opencontainers.image.authors="Ian Johnson (johnsoni@mskcc.org)"

LABEL org.opencontainers.image.created=${BUILD_DATE} \
    org.opencontainers.image.version=${BUILD_VERSION} \
    org.opencontainers.image.version.multiqc=${MULTIQC_VERSION} \
    org.opencontainers.image.vcs-url="https://github.com/msk-access/multiqc.git" \
    org.opencontainers.image.vcs-ref=${VCS_REF}

LABEL org.opencontainers.image.description="This container uses python3.6 as the base image to build \
    multiqc version ${MULTIQC_VERSION}"

################## INSTALL ##########################

RUN apt-get update \
  && apt-get install git gcc g++ zlib1g-dev -y \
  && git clone https://github.com/msk-access/MultiQC.git --branch msk-access \
  && cd MultiQC \
  && pip install .
