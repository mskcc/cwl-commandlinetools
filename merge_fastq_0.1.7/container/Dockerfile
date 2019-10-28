################## BASE IMAGE ######################

FROM continuumio/miniconda3:4.7.12

################## ARGUMENTS/Environments ##########

ARG BUILD_DATE
ARG BUILD_VERSION
ARG MINICONDA3_VERSION=4.7.12
ARG LICENSE="Apache-2.0"
ARG MERGE_FASTQ_VERSION=0.1.7
ARG VCS_REF
################## METADATA ########################
LABEL org.opencontainers.image.vendor="MSKCC"
LABEL org.opencontainers.image.authors="Ronak H Shah (shahr2@mskcc.org)" 

LABEL org.opencontainers.image.created=${BUILD_DATE} \ 
    org.opencontainers.image.version=${BUILD_VERSION} \
    org.opencontainers.image.licenses=${LICENSE} \
    org.opencontainers.image.version.miniconda3=${MINICONDA3_VERSION} \
    org.opencontainers.image.version.merge_fastq=${MERGE_FASTQ_VERSION} \
    org.opencontainers.image.source.merge_fastq="https://pypi.org/project/merge-fastq/" \
    org.opencontainers.image.vcs-url="https://github.com/msk-access/cwl-commandlinetools.git" \
    org.opencontainers.image.vcs-ref=${VCS_REF}

LABEL org.opencontainers.image.description="This container uses miniconda ${MINICONDA3_VERSION} as the base image to build \
    merge fastq version ${MERGE_FASTQ_VERSION}"

################## INSTALL ##########################

#Ubuntu
RUN conda create --name merge_fastq python=3.7 && \
    echo "source activate merge_fastq" > ~/.bashrc

#Set the path of environment as default
ENV PATH /opt/conda/envs/merge_fastq/bin:$PATH

#MERGE_FASTQ
RUN pip install --upgrade merge-fastq==${MERGE_FASTQ_VERSION}
