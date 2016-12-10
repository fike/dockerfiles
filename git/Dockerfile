FROM debian:jessie

MAINTAINER  Fernando Ike de Oliveira <fike@midstorm.org>

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && \
      apt-get upgrade -y && \
      apt-get install -y --no-install-recommends  \
          --no-install-suggests \
          git \
          openssh-client \
	  ca-certificates

RUN apt-get clean && \
     apt-get autoremove --purge -y && \
     rm -rf /var/lib/apt/lists/* \
        /tmp/* \
        /var/tmp/* \
        /usr/share/man/??_* \
        /usr/share/man/??
