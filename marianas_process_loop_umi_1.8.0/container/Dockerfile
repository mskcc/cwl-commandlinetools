FROM java:8

LABEL maintainer='Ian Johnson (johnsoni@mskcc.org)' \
	version.image='1.0.0' \
	version.marianas='1.8.1' \
	source.marianas='https://github.com/mskcc/marianas/tag/1.8.1'

ENV MARIANAS_VERSION 1.8.1

# Install Marianas
RUN wget https://github.com/juberpatel/Marianas/releases/download/v1.8.1/Marianas-1.8.1.jar
RUN mv Marianas-1.8.1.jar /usr/bin/Marianas-1.8.1.jar
