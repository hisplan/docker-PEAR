FROM ubuntu:16.04

LABEL maintainer="Jaeyoung Chun (jaeyoung.chun@weizmann.ac.il)"

ENV PEAR_VERSION="0.9.2"

RUN apt-get update -y \
    && apt-get install -y wget build-essential unzip

COPY PEAR-master.zip /tmp

# install PEAR
RUN cd /tmp \
    && unzip PEAR-master.zip \
    && cd PEAR-master \
    && make \
    && make install

# clean up
RUN rm -rf /tmp/PEAR-master.zip /tmp/PEAR-master/

ENTRYPOINT ["/usr/local/bin/pear"]
