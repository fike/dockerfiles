FROM fike/debian:jessie.en_US

MAINTAINER Fernando Ike <fike@midstorm.org>

ENV DEBIAN_FRONTEND noninteractive

RUN sed -i s/main/main\ non-free\ contrib/g /etc/apt/sources.list && \
      apt-get update -y && \
      apt-get upgrade -y && \
      apt-get install -y --no-install-recommends \
        --no-install-suggests \
        java-package \ 
        libxslt1.1 \ 
        libfontconfig1 \
        libpangoft2-1.0-0 \ 
        libfontconfig1 \
        libpangoft2-1.0-0 \ 
        libxtst6 \ 
        libcairo2 \ 
        libpango-1.0.0 \ 
        libgtk2.0-0 \ 
        libxxf86vm1 \ 
        libgl1-mesa-glx \ 
        libxxf86vm1-dbg \
        build-essential \
        fakeroot && \
     apt-get clean && \
     apt-get autoremove --purge -y && \
     rm -rf /var/lib/apt/lists/* \
        /tmp/* \
        /var/tmp/* \
        /usr/share/man/??_* \
        /usr/share/man/??

RUN useradd -m -s /bin/bash builder -G users

USER builder 

RUN mkdir /home/builder/java

WORKDIR /home/builder/java
