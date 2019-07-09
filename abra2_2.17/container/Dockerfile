################## BASE IMAGE ######################

FROM openjdk:8

################## ARGUMENTS########################

ARG BUILD_DATE
ARG BUILD_VERSION
ARG LICENSE="Apache-2.0"
ARG JAVA_VERSION=8
ARG ABRA2_VERSION=2.17

################## METADATA ########################

LABEL org.opencontainers.image.vendor="MSKCC"
LABEL org.opencontainers.image.authors="Ronak H Shah (shahr2@mskcc.org)" 

LABEL org.opencontainers.image.created=${BUILD_DATE} \ 
	org.opencontainers.image.version=${BUILD_VERSION} \
	org.opencontainers.image.licenses=${LICENSE} \
	org.opencontainers.image.version.java=${JAVA_VERSION} \
	org.opencontainers.image.version.abra2=${ABRA2_VERSION} \
	org.opencontainers.image.source.abra2="https://github.com/mozack/abra2/releases/"

LABEL org.opencontainers.image.description="This container uses OPENJDK ${JAVA_VERSION} as the base image to build abra2 version ${ABRA2_VERSION}"

################## INSTALL ##########################

WORKDIR /usr/src

RUN apt-get update && \
	apt-get --no-install-recommends install -y \
	wget && \
	apt-get clean autoclean && \
	apt-get autoremove -y && \
	rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN wget "https://github.com/mozack/abra2/releases/download/v${ABRA2_VERSION}/abra2-${ABRA2_VERSION}.jar" && \
	chmod 755 /usr/src/abra2-${ABRA2_VERSION}.jar && \
    cp -s /usr/src/abra2-${ABRA2_VERSION}.jar /usr/local/bin/abra2.jar 