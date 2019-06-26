FROM java:8

LABEL maintainer='Shalabh Suman (sumans@mskcc.org)'

ARG BUILD_DATE

# Labels
LABEL org.label-schema.schema-version="1.0"
LABEL org.label-schema.build-date=$BUILD_DATE
LABEL org.label-schema.vcs-url = "https://github.com/juberpatel/Waltz/blob/master/Waltz-2.0.jar"
LABEL org.label-schema.vcs-ref = "563f1ce"
LABEL org.label-schema.name = "waltz"
LABEL org.label-schema.description = "Syntax to build image: docker build --build-arg BUILD_DATE=$(date -u +'%Y-%m-%dT%H:%M:%SZ') -t waltz_1.0.0 ."
LABEL version.image='1.0.0' \
	version.waltz='2.0.0'

ARG WALTZ_VERSION_cmd=2.0
ENV WALTZ_VERSION=${WALTZ_VERSION_cmd}

# Install Waltz
RUN wget https://github.com/juberpatel/Waltz/blob/master/Waltz-${WALTZ_VERSION}.jar
RUN mv Waltz-${WALTZ_VERSION}.jar /usr/local/bin/Waltz-${WALTZ_VERSION}.jar