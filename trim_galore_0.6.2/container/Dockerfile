################## BASE IMAGE ######################

FROM ubuntu:18.04

################## ARGUMENTS/Environments ##########

ARG BUILD_DATE
ARG BUILD_VERSION
ARG UBUNTU_VERSION=18.04
ARG LICENSE="Apache-2.0"
ARG CUTADAPT_VERSION=2.3
ARG FASTQC_VERSION=0.11.8
ARG TRIMGALORE_VERSION=0.6.2

################## METADATA ########################
LABEL org.opencontainers.image.vendor="MSKCC"
LABEL org.opencontainers.image.authors="Ronak H Shah (shahr2@mskcc.org)" 

LABEL org.opencontainers.image.created=${BUILD_DATE} \ 
	org.opencontainers.image.version=${BUILD_VERSION} \
	org.opencontainers.image.licenses=${LICENSE} \
	org.opencontainers.image.version.trimgalore=${TRIMGALORE_VERSION} \
	org.opencontainers.image.version.cutadpt=${CUTADAPT_VERSION} \
	org.opencontainers.image.version.fastqc=${FASTQC_VERSION} \
	org.opencontainers.image.version.ubuntu=${UBUNTU_VERSION} \
	org.opencontainers.image.source.trimgalore="https://github.com/FelixKrueger/TrimGalore/archive/${TRIMGALORE_VERSION}.tar.gz" \
	org.opencontainers.image.source.cutadapt="https://pypi.org/project/cutadapt/" \
	org.opencontainers.image.source.fastqc="https://www.bioinformatics.babraham.ac.uk/projects/fastqc/fastqc_v${FASTQC_VERSION}.zip"

LABEL org.opencontainers.image.description="This container uses ubuntu ${UBUNTU_VERSION} as the base image to build \
	cutadpat version ${CUTADAPT_VERSION}, \
	fastq version ${FASTQC_VERSION} and \ 
	trim_galore version ${TRIMGALORE_VERSION}"

################## INSTALL ##########################

#Ubuntu
RUN apt-get update && \
	apt-get --no-install-recommends install -y build-essential python3 python3-pip pigz python3-dev wget zip unzip default-jre && \
	apt-get clean && apt-get purge && apt autoremove && apt-get remove --yes --purge build-essential && \
	rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

#Cutadapt
RUN pip3 install --upgrade cutadapt==${CUTADAPT_VERSION}

WORKDIR /usr/src

#Get fastqc
RUN wget https://www.bioinformatics.babraham.ac.uk/projects/fastqc/fastqc_v${FASTQC_VERSION}.zip && \
	unzip fastqc_v${FASTQC_VERSION}.zip && \
	rm fastqc_v${FASTQC_VERSION}.zip && \
	chmod a+x FastQC/fastqc

ENV PATH=$PATH:/usr/src/FastQC/

#trim galore
RUN wget https://github.com/FelixKrueger/TrimGalore/archive/${TRIMGALORE_VERSION}.tar.gz && \
	tar xvzf ${TRIMGALORE_VERSION}.tar.gz && \
	rm ${TRIMGALORE_VERSION}.tar.gz && \
	ln -s /usr/src/TrimGalore-${TRIMGALORE_VERSION}/trim_galore /usr/local/bin/trim_galore
