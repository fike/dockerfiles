FROM fike/debian:jessie.pt_BR

MAINTAINER Fernando Ike <fike@midstorm.org>

ENV DEBIAN_FRONTEND noninteractive

RUN sed -i 's/jessie\ main/jessie\ main\ contrib\ non-free/g' /etc/apt/sources.list && \
      sed -i 's/jessie\-updates\ main/jessie\-updates\ main\ contrib\ non-free/g' \
      /etc/apt/sources.list

RUN echo "deb http://mozilla.debian.net/ jessie-backports firefox-release" \ 
      >> /etc/apt/sources.list.d/mozilla.list

RUN apt-get update -y

RUN apt-get install pkg-mozilla-archive-keyring -y && apt-get update -y

RUN apt-get install -t jessie-backports --no-install-recommends \
      firefox \ 
      firefox-l10n-pt-br -y  && \
      apt-get install --no-install-recommends --no-install-suggests \
      icedtea-plugin \
      flashplugin-nonfree -y

RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

CMD firefox --version
