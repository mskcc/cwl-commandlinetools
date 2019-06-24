FROM java:8

LABEL maintainer='Shalabh Suman (sumans@mskcc.org)' \
    build_date='06/24/2019' \
	version.image='1.0.0' \
	version.waltz='2.0.0' \
	source.waltz='https://github.com/mskcc/juberpatel/Waltz/tag/x.x.todo'

ENV WALTZ_VERSION 2.0.0

# Install Waltz
RUN wget https://github.com/juberpatel/Waltz/blob/master/Waltz-3.0.jar
RUN mv Waltz-3.0.jar /usr/bin/Waltz-3.0.jar