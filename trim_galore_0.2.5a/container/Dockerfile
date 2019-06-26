################## BASE IMAGE ######################
FROM ubuntu:18.04

################## METADATA ######################

LABEL base_image="ubuntu:18.04"
LABEL center="MSKCC"
LABEL maintainer="Ronak H Shah (shahr2@mskcc.org)" 
LABEL version.image="0.2.5a" \
	version.trimgalore="0.2.5" \
	version.cutadpt="1.1" \
	version.fastqc="0.11.8" \
	version.ubuntu="18.04" \
	source.trimgalore="https://raw.githubusercontent.com/rhshah/IMPACT-Pipeline/master/modified_tools/trim_galore_v0.2.5.tgz" \
	source.cutadapt="https://pypi.org/project/cutadapt/" \
	source.fastqc="https://www.bioinformatics.babraham.ac.uk/projects/fastqc/fastqc_v0.11.8.zip"
LABEL description="This container uses ubuntu 18.04 as the base image to build \
        cutadpat version 1.1, \
	fastq version 0.11.8 and \ 
	trim_galore version 0.2.5a"

################## INSTALLATION ######################
#Cutadapt
RUN apt-get update && apt-get -y upgrade && apt-get install -y build-essential python2.7 python-pip python2.7-dev && \
	apt-get clean && apt-get purge && \
        rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN pip2 install --upgrade cutadapt==1.1

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
RUN wget https://raw.githubusercontent.com/rhshah/IMPACT-Pipeline/master/modified_tools/trim_galore_v0.2.5.tgz \
	-O trim_galore_v0.2.5.tgz && \
	tar xvzf trim_galore_v0.2.5.tgz

# Clean
RUN  apt-get clean ; apt-get remove --yes --purge build-essential

ENV PATH=$PATH:/usr/src/FastQC/:/usr/src/dmp/resources/prod/tools/bio/trim_galore/VERSIONS/trim_galore_v0.2.5
