FROM ubuntu:18.04

LABEL center="MSKCC"
LABEL maintainer="Ronak H Shah (shahr2@mskcc.org)" 
LABEL version.image="0.0.1" \
	version.trimgalore="0.6.2" \
	version.cutadpt="2.3" \
	version.fastqc="0.11.8" \
	version.ubuntu="18.04" \
	source.trimgalore="https://github.com/FelixKrueger/TrimGalore/archive/0.6.2.tar.gz" \
	source.cutadapt="https://pypi.org/project/cutadapt/" \
	source.fastqc="https://www.bioinformatics.babraham.ac.uk/projects/fastqc/fastqc_v0.11.8.zip"
LABEL description="This container uses ubuntu 18.04 as the base image to build \
        cutadpat version 2.3, \
	fastq version 0.11.8 and \ 
	trim_galore version 0.6.2"
#Cutadapt
RUN apt-get update && apt-get -y upgrade && apt-get install -y build-essential python3 python3-pip python3-dev && \
	apt-get clean && apt-get purge && \
        rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN pip3 install --upgrade cutadapt==2.3

WORKDIR /usr/src

#Get fastqc
RUN apt-get update && apt-get -y upgrade && apt-get install -y wget zip default-jre && \
	apt-get clean && apt-get purge && \
        rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
RUN wget https://www.bioinformatics.babraham.ac.uk/projects/fastqc/fastqc_v0.11.8.zip && \
	unzip fastqc_v0.11.8.zip && \
	rm fastqc_v0.11.8.zip && \
	chmod a+x FastQC/fastqc

#trim galore
RUN wget https://github.com/FelixKrueger/TrimGalore/archive/0.6.2.tar.gz -O trim_galore.tar.gz && \
	tar xvzf trim_galore.tar.gz

# Clean
RUN  apt-get clean ; apt-get remove --yes --purge build-essential

ENV PATH=$PATH:/usr/src/FastQC/:/usr/src/TrimGalore-0.6.2/
