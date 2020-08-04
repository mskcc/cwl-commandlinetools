################## BASE IMAGE ######################

FROM python:3.6-alpine

################## ARGUMENTS/Environments ##########

ARG BUILD_DATE
ARG BUILD_VERSION
ARG LICENSE="Apache-2.0"
ARG SEQUENCE_QC_VERSION=0.1.12
ARG VCS_REF
################## METADATA ########################
LABEL org.opencontainers.image.vendor="MSKCC"
LABEL org.opencontainers.image.authors="Charlie Murphy (murphyc4@mskcc.org)" 

LABEL org.opencontainers.image.created=${BUILD_DATE} \ 
    org.opencontainers.image.version=${BUILD_VERSION} \
    org.opencontainers.image.licenses=${LICENSE} \
    org.opencontainers.image.version.sequence_qc=${SEQUENCE_QC_VERSION} \
    org.opencontainers.image.source.sequence_qc="https://pypi.org/project/sequence_qc/" \
    org.opencontainers.image.vcs-url="https://github.com/msk-access/cwl-commandlinetools.git" \
    org.opencontainers.image.vcs-ref=${VCS_REF}

LABEL org.opencontainers.image.description="This container uses python3.6 as the base image to build \
    sequence_qc version ${SEQUENCE_QC_VERSION}"

################## INSTALL ##########################

RUN apk add --no-cache --virtual .build-deps gcc musl-dev make zlib-dev bzip2-dev xz-dev g++ libstdc++ \
 && pip install cython \
 && pip install sequence_qc==0.1.12 \
 && apk del .build-deps