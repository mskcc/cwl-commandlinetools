
################## BASE IMAGE ######################
FROM java:8

################## ARGUMENTS #######################
ARG BUILD_DATE
ARG BUILD_VERSION=1.0.0
ARG WALTZ_VERSION_cmd=3.2.0


################## LABELS #######################
LABEL org.opencontainers.image.authors='Shalabh Suman (sumans@mskcc.org)'
LABEL org.opencontainers.image.created=$BUILD_DATE
#LABEL org.opencontainers.image.source = "https://github.com/juberpatel/Waltz/blob/master/Waltz-2.0.jar"
LABEL org.opencontainers.image.source = "https://github.com/msk-access/cwl_commandlinetools"
LABEL org.opencontainers.image.revision = "10037a1"
LABEL org.opencontainers.image.title = "waltz"
LABEL org.opencontainers.image.description = "Syntax to build image: docker build --build-arg BUILD_DATE=$(date -u +'%Y-%m-%dT%H:%M:%SZ') -t mskcc/waltz:1.0.0 ."
LABEL org.opencontainers.image.version=${BUILD_VERSION}
LABEL org.opencontainers.image.version.waltz=${WALTZ_VERSION_cmd}

################## ENVIRONMENTS #######################
ENV WALTZ_VERSION=${WALTZ_VERSION_cmd}

# Install Waltz
#RUN wget https://github.com/juberpatel/Waltz/blob/master/Waltz-${WALTZ_VERSION}.jar
RUN wget https://github.com/mskcc/Waltz/releases/download/v${WALTZ_VERSION}/Waltz-${WALTZ_VERSION}.jar
RUN mv Waltz-${WALTZ_VERSION}.jar /usr/local/bin/Waltz.jar

#ENV PATH=$PATH:/usr/local/bin/Waltz.jar