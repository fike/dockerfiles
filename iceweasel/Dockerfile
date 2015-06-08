FROM fike/debian-jessie-ptbr

MAINTAINER Fernando Ike <fike@midstorm.org>

ENV DEBIAN_FRONTEND noninteractive

RUN echo deb http://mozilla.debian.net/ jessie-backports \
       iceweasel-release >> /etc/apt/sources.list.d/mozilla

RUN apt-get update -y && apt-get upgrade -y

RUN apt-get install pkg-mozilla-archive-keyring -y && \ 
      apt-get install -t jessie-backports iceweasel iceweasel-l10n-pt-br \ 
      icedtea-plugin  -y

RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

CMD iceweasel --version
