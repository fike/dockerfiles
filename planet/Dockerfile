FROM fike/debian:jessie.pt_BR

MAINTAINER  Fernando Ike de Oliveira <fike@midstorm.org>

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && \
      apt-get upgrade -y && \
      apt-get install -y --no-install-recommends  \
          --no-install-suggests \
          planet-venus

RUN apt-get clean && \
     apt-get autoremove --purge -y && \
     rm -rf /var/lib/apt/lists/* \
        /tmp/* \
        /var/tmp/* \
        /usr/share/man/??_* \
        /usr/share/man/??

CMD planet config/planet.conf
