################## BASE IMAGE ######################

FROM openjdk:8

################## ARGUMENTS########################

ARG BUILD_DATE
ARG BUILD_VERSION
ARG LICENSE="Apache-2.0"
ARG JAVA_VERSION=8
ARG MARIANAS_VERSION=1.8.1

################## METADATA ########################

LABEL org.opencontainers.image.vendor="MSKCC"
LABEL org.opencontainers.image.authors="Ian C Johnson (johnsoni@mskcc.org)"

LABEL org.opencontainers.image.created=${BUILD_DATE} \
	org.opencontainers.image.version=${BUILD_VERSION} \
	org.opencontainers.image.licenses=${LICENSE} \
	org.opencontainers.image.version.java=${JAVA_VERSION} \
	org.opencontainers.image.version.marianas=${MARIANAS_VERSION} \
	org.opencontainers.image.source="https://github.com/msk-access/cwl_commandlinetools"

LABEL org.opencontainers.image.description="This container uses OPENJDK ${JAVA_VERSION} as the base image to use Marianas version ${MARIANAS_VERSION}"

################## INSTALL ##########################

ENV MARIANAS_VERSION 1.8.1

WORKDIR /usr/src/

RUN wget https://github.com/mskcc/Marianas/releases/download/v1.8.1/Marianas-1.8.1.jar
RUN cp -s /usr/src/Marianas-1.8.1.jar /usr/local/bin/Marianas-1.8.1.jar