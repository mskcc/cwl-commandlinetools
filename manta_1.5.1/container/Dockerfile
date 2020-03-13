################## BASE IMAGE ######################

FROM ubuntu:16.04

################## ARGUMENTS/Environments ##########

ARG BUILD_DATE
ARG BUILD_VERSION
ARG VCS_REF
ARG UBUNTU_VERSION=16.04
ARG LICENSE="Apache-2.0"
ARG MANTA_VERSION=1.5.1
ARG SAMTOOLS_VERSION=1.9
ARG HTSLIB_VERSION=1.9

################## METADATA ########################
LABEL org.opencontainers.image.vendor="MSKCC"
LABEL org.opencontainers.image.authors="Ronak H Shah (shahr2@mskcc.org)" 

LABEL org.opencontainers.image.created=${BUILD_DATE} \
	org.opencontainers.image.version=${BUILD_VERSION} \
	org.opencontainers.image.licenses=${LICENSE} \
	org.label-schema.vcs-ref=${VCS_REF} \
	org.label-schema.vcs-url="https://github.com/msk-access/cwl-commandlinetools" \
	org.opencontainers.image.version.manta=${MANTA_VERSION} \
	org.opencontainers.image.version.samtools=${SAMTOOLS_VERSION} \
	org.opencontainers.image.version.samtools=${HTSLIB_VERSION} \
	org.opencontainers.image.version.ubuntu=${UBUNTU_VERSION} \
	org.opencontainers.image.source.manta="https://github.com/Illumina/manta/releases/download/v${MANTA_VERSION}/manta-${MANTA_VERSION}.centos6_x86_64.tar.bz2" \
	org.opencontainers.image.source.samtools=" https://github.com/samtools/samtools/releases/download/${SAMTOOLS_VERSION}/samtools-${SAMTOOLS_VERSION}.tar.bz2" \
	org.opencontainers.image.source.htslib="https://github.com/samtools/htslib/releases/download/${HTSLIB_VERSION}/htslib-${HTSLIB_VERSION}.tar.bz2"

LABEL org.opencontainers.image.description="This container uses ubuntu ${UBUNTU_VERSION} as the base image to build \
	manta version ${MANTA_VERSION}, \
	samtools version ${SAMTOOLS_VERSION} and \ 
	htslib version ${HTSLIB_VERSION}"

################## INSTALL ##########################


#UBUNTU
RUN apt-get update \
	&& apt install -y g++ libbz2-dev liblzma-dev make ncurses-dev wget zlib1g-dev libcurl4-openssl-dev wget python bzip2 \
	&& apt-get clean \ 
	&& apt-get purge \
	&& apt-get remove --yes --purge build-essential \
        && rm -rf /var/lib/apt/lists/* /tmp/* /:var/tmp/*	

#MANTA
RUN apt-get update \
	&& wget https://github.com/Illumina/manta/releases/download/v${MANTA_VERSION}/manta-${MANTA_VERSION}.centos6_x86_64.tar.bz2 \
	&& tar -jxvf manta-${MANTA_VERSION}.centos6_x86_64.tar.bz2 \ 
	&& rm -rf /manta-${MANTA_VERSION}.centos6_x86_64.tar.bz2 \
	&& rm -rf /manta-${MANTA_VERSION}.centos6_x86_64/share/demo \
	&& ln -s $PWD/manta-${MANTA_VERSION}.centos6_x86_64 /usr/local/bin/manta \
	&& cp $PWD/manta-${MANTA_VERSION}.centos6_x86_64/libexec/convertInversion.py /usr/local/bin \
	&& chmod +x /usr/local/bin/* \
	&& apt-get clean \
        && apt-get purge \
        && apt-get remove --yes --purge build-essential \
        && rm -rf /var/lib/apt/lists/* /tmp/* /:var/tmp/*

#SAMTOOLS
RUN apt-get update && apt-get install -y \
	&& wget https://github.com/samtools/htslib/releases/download/${HTSLIB_VERSION}/htslib-${HTSLIB_VERSION}.tar.bz2 \
	&& wget https://github.com/samtools/samtools/releases/download/${SAMTOOLS_VERSION}/samtools-${SAMTOOLS_VERSION}.tar.bz2 \
	&& tar xvjf htslib-${HTSLIB_VERSION}.tar.bz2 \
	&& cd htslib-${HTSLIB_VERSION} \
	&& ./configure --enable-libcurl \
 	&& make \
 	&& cd ../.. \
 	&& tar xvjf samtools-${SAMTOOLS_VERSION}.tar.bz2 \
	&& cd samtools-${SAMTOOLS_VERSION} \
	&& ./configure --enable-libcurl \
	&& make \
	&& rm -r /htslib-${HTSLIB_VERSION}/test \
 	&& cp -r /htslib-${HTSLIB_VERSION}/* /usr/local/bin \
	&& rm -r /samtools-${SAMTOOLS_VERSION}/test \
	&& cp -r /samtools-${SAMTOOLS_VERSION}/* /usr/local/bin \
	&& apt-get clean \
        && apt-get purge \
        && apt-get remove --yes --purge build-essential \
        && rm -rf /var/lib/apt/lists/* /tmp/* /:var/tmp/*
