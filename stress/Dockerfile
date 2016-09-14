FROM debian:jessie

MAINTAINER Fernando Ike <fike@midstorm.org>

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update -y && \
      apt-get upgrade -y && \
      apt-get install -y --no-install-recommends \
        --no-install-suggests \
        stress && \
      apt-get clean && \
      apt-get autoremove --purge -y && \
      rm -rf /var/lib/apt/lists/* \
        /tmp/* \
        /var/tmp/* \
        /usr/share/man/??_* \
        /usr/share/man/??
