################## ARGUMENTS #######################

ARG BUILD_DATE
ARG BUILD_VERSION

################## BASE IMAGE ######################

FROM ubuntu:18.04

################## METADATA ########################
LABEL org.opencontainers.image.vendor="MSKCC"
LABEL org.opencontainers.image.authors="Ronak H Shah (shahr2@mskcc.org)" 

LABEL org.opencontainers.image.created=${BUILD_DATE} \ 
	org.opencontainers.image.version=${BUILD_VERSION} \
	org.opencontainers.image.licenses="Apache-2.0"\
	org.opencontainers.image.version.trimgalore="0.6.2" \
	org.opencontainers.image.version.cutadpt="2.3" \
	org.opencontainers.image.version.fastqc="0.11.8" \
	org.opencontainers.image.version.ubuntu="18.04" \
	org.opencontainers.image.source.trimgalore="https://github.com/FelixKrueger/TrimGalore/archive/0.6.2.tar.gz" \
	org.opencontainers.image.source.cutadapt="https://pypi.org/project/cutadapt/" \
	org.opencontainers.image.source.fastqc="https://www.bioinformatics.babraham.ac.uk/projects/fastqc/fastqc_v0.11.8.zip"

LABEL org.opencontainers.image.description="This container uses ubuntu 18.04 as the base image to build \
	cutadpat version 2.3, \
	fastq version 0.11.8 and \ 
	trim_galore version 0.6.2"

################## ENVIRONMENT ######################

ENV CUTADAPT_VERSION 2.3
ENV FASTQC_VERSION 0.11.8
ENV TRIMGALORE_VERSION 0.6.2

################## INSTALL ##########################

#Cutadapt
RUN apt-get update && apt-get -y upgrade && apt-get install -y build-essential python3 python3-pip python3-dev && \
	apt-get clean && apt-get purge && \
        rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN pip3 install --upgrade cutadapt==${CUTADAPT_VERSION}

WORKDIR /usr/src

#Get fastqc
RUN apt-get update && apt-get -y upgrade && apt-get install -y wget zip default-jre && \
	apt-get clean && apt-get purge && \
        rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
RUN wget https://www.bioinformatics.babraham.ac.uk/projects/fastqc/fastqc_v${FASTQC_VERSION}.zip && \
	unzip fastqc_v${FASTQC_VERSION}.zip && \
	rm fastqc_v${FASTQC_VERSION}.zip && \
	chmod a+x FastQC/fastqc

#trim galore
RUN wget https://github.com/FelixKrueger/TrimGalore/archive/${TRIMGALORE_VERSION}.tar.gz && \
	tar xvzf ${TRIMGALORE_VERSION}.tar.gz && \
	rm ${TRIMGALORE_VERSION}.tar.gz

# Clean
RUN  apt-get clean ; apt-get remove --yes --purge build-essential

ENV PATH=$PATH:/usr/src/FastQC/:/usr/src/TrimGalore-${TRIMGALORE_VERSION}/
