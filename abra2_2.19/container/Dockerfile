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
	org.opencontainers.image.version.ubuntu="18.04" \
	org.opencontainers.image.version.abra2="2.19" \
	org.opencontainers.image.source.abra2="https://github.com/mozack/abra2/releases/"

LABEL org.opencontainers.image.description="This container uses ubuntu 18.04 as the base image to build abra2 version 2.19"

################## ENVIRONMENT ######################

ENV ABRA2_VERSION 2.19

################## INSTALL ##########################

WORKDIR /usr/src

RUN apt-get update && \
	apt-get -y upgrade && \
	apt-get install -y build-essential wget openjdk-8-jdk && \
	apt-get clean && apt-ge 	t purge && apt autoremove && apt-get remove --yes --purge build-essential && \
	rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN wget https://github.com/mozack/abra2/releases/download/v${ABRA2_VERSION}/abra2-${ABRA2_VERSION}.jar

RUN chmod 755 /usr/src/abra2-${ABRA2_VERSION}.jar && \
    ln -s /usr/src/abra2-${ABRA2_VERSION}.jar /usr/local/bin/abra2.jar 

