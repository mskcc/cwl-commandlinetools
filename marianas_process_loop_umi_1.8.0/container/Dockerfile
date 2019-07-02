FROM java:8

LABEL maintainer='Ian Johnson (johnsoni@mskcc.org)' \
	version.image='1.0.0' \
	version.marianas='1.8.0' \
	source.marianas='https://github.com/mskcc/marianas/tag/x.x.todo'

ENV MARIANAS_VERSION 1.8.0

# Install Marianas
RUN wget https://github.com/mskcc/Marianas/raw/ij/add_Marianas-1.8.0.jar/Marianas-1.8.0.jar
RUN mv Marianas-1.8.0.jar /usr/bin/Marianas-1.8.0.jar
