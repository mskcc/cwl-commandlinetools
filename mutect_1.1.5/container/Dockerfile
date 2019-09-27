################## BASE IMAGE ######################
FROM openjdk:7

################## ARGUMENTS/Environments ##########

ARG BUILD_DATE
ARG BUILD_VERSION=0.1.0
ARG MUTECT_VERSION=1.1.5

################## METADATA ########################
LABEL org.opencontainers.image.vendor="MSKCC"
LABEL org.opencontainers.image.authors="Yu Hu" 

LABEL org.opencontainers.image.created=${BUILD_DATE}
LABEL org.opencontainers.image.version=${BUILD_VERSION}
LABEL org.opencontainers.image.version.mutect=${MUTECT_VERSION}
LABEL org.opencontainers.image.source="https://github.com/broadinstitute/mutect/releases/download/${MUTECT_VERSION}/muTect-${MUTECT_VERSION}-bin.zip"

LABEL org.opencontainers.image.description="This container uses java7 as the base image to build mutect version ${MUTECT_VERSION}"

################## INSTALL ##########################

ENV MUTECT_VERSION=${MUTECT_VERSION}

#Get Mutect
RUN wget https://github.com/broadinstitute/mutect/releases/download/${MUTECT_VERSION}/muTect-${MUTECT_VERSION}-bin.zip
RUN unzip muTect-${MUTECT_VERSION}-bin.zip
RUN rm muTect-${MUTECT_VERSION}-bin.zip
RUN chmod a+x muTect-${MUTECT_VERSION}.jar
RUN mv muTect-${MUTECT_VERSION}.jar /usr/local/bin/muTect.jar

