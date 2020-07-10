################## BASE IMAGE ######################
FROM alpine:3.8

################## ARGUMENTS/Environments ##########

ARG BUILD_DATE
ARG BUILD_VERSION=1.0.0
ARG HTSLIB_VERSION=1.6
ARG BCFTOOLS_VERSION=1.6

################## METADATA ########################
LABEL org.opencontainers.image.vendor="MSKCC"
LABEL org.opencontainers.image.authors="Nikhil Kumar (kumarn1@mskcc.org)"
LABEL org.opencontainers.image.created=${BUILD_DATE}
LABEL org.opencontainers.image.version=${BUILD_VERSION}
LABEL org.opencontainers.image.version.htslib=${HTSLIB_VERSION}
LABEL org.opencontainers.image.version.bcftools=${BCFTOOLS_VERSION}
LABEL org.opencontainers.image.version.perl="5.26.2-r1"
LABEL org.opencontainers.image.version.alpine="3.8"
LABEL org.opencontainers.image.source.htslib="https://github.com/samtools/htslib/releases/tag/${HTSLIB_VERSION}"
LABEL org.opencontainers.image.source.bcftools="https://github.com/samtools/bcftools/releases/tag/${BCFTOOLS_VERSION}"


LABEL org.opencontainers.image.description="This container uses alpine3.8 as the base image to build bcftools version ${BCFTOOLS_VERSION}"

################## INSTALL ##########################

ENV HTSLIB_VERSION=${HTSLIB_VERSION}
ENV BCFTOOLS_VERSION=${BCFTOOLS_VERSION}


RUN apk add --update \
      # install all the build-related tools
            && apk add ca-certificates gcc g++ make git curl curl-dev wget gzip perl perl-dev musl-dev libgcrypt-dev zlib-dev bzip2-dev xz-dev ncurses-dev rsync \
      # install system packages and Perl modules
            && apk add expat-dev libressl-dev perl-net-ssleay mariadb-dev libxml2-dev perl-dbd-mysql perl-module-metadata perl-gd perl-db_file perl-archive-zip perl-cgi perl-dbi perl-encode perl-time-hires perl-file-copy-recursive perl-json \
      # install htslib (for vep)
            && cd /tmp && wget https://github.com/samtools/htslib/releases/download/${HTSLIB_VERSION}/htslib-${HTSLIB_VERSION}.tar.bz2 \
            && tar xvjf htslib-${HTSLIB_VERSION}.tar.bz2 \
            && cd /tmp/htslib-${HTSLIB_VERSION} \
            && ./configure \
            && make && make install \
      # install bcftools
            && cd /tmp && wget https://github.com/samtools/bcftools/releases/download/${BCFTOOLS_VERSION}/bcftools-${BCFTOOLS_VERSION}.tar.bz2 \
            && tar xvjf bcftools-${BCFTOOLS_VERSION}.tar.bz2 \
            && cd /tmp/bcftools-${BCFTOOLS_VERSION} \
            && make HTSDIR=/tmp/htslib-${HTSLIB_VERSION} && make install \
      # clean up
            && rm -rf /var/cache/apk/* /tmp/* \
            && chmod +x /usr/bin/runscript.sh \
            && exec /run_test.sh
