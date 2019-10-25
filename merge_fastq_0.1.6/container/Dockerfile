################## BASE IMAGE ######################

FROM ubuntu:18.04

################## ARGUMENTS/Environments ##########

ARG BUILD_DATE
ARG BUILD_VERSION
ARG UBUNTU_VERSION=18.04
ARG LICENSE="Apache-2.0"
ARG MERGE_FASTQ_VERSION=0.1.6
ARG VCS_REF
################## METADATA ########################
LABEL org.opencontainers.image.vendor="MSKCC"
LABEL org.opencontainers.image.authors="Ronak H Shah (shahr2@mskcc.org)" 

LABEL org.opencontainers.image.created=${BUILD_DATE} \ 
    org.opencontainers.image.version=${BUILD_VERSION} \
    org.opencontainers.image.licenses=${LICENSE} \
    org.opencontainers.image.version.trimgalore=${MERGE_FASTQ_VERSION} \
    org.opencontainers.image.source.cutadapt="https://pypi.org/project/merge-fastq/" \
    org.opencontainers.image.vcs-url="https://github.com/msk-access/cwl-commandlinetools.git" \
    org.opencontainers.image.vcs-ref=${VCS_REF}

LABEL org.opencontainers.image.description="This container uses ubuntu ${UBUNTU_VERSION} as the base image to build \
    cutadpat version ${MERGE_FASTQ_VERSION}"

################## INSTALL ##########################

#Ubuntu
RUN apt-get update && \
    apt-get --no-install-recommends install -y build-essential python3 python3-pip python3-dev wget zip unzip default-jre && \
    apt-get clean && apt-get purge && apt autoremove && apt-get remove --yes --purge build-essential && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

#MERGE_FASTQ
RUN pip3 install --upgrade merge-fastq==${MERGE_FASTQ_VERSION}
