FROM debian:sid

MAINTAINER Fernando Ike <fike@midstorm.org>

ENV DEBIAN_FRONTEND noninteractive

RUN echo "deb-src http://httpredir.debian.org/debian/ unstable main"  >> /etc/apt/sources.list && \
      apt-get update -y  && \
      apt-get upgrade -y && \
      apt-get install -y --no-install-recommends --no-install-suggests \
        packaging-dev \ 
        fakeroot \
        sudo && \
      apt-get clean && \
      apt-get autoremove --purge -y && \
      rm -rf /var/lib/apt/lists/* \
        /tmp/* \
        /var/tmp/* \
        /usr/share/man/??_* \
        /usr/share/man/??

RUN echo "builder  ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers.d/builder && \
      useradd -m -s /bin/bash builder -G users

RUN mkdir -p /home/builder/d

WORKDIR /home/builder/d      
