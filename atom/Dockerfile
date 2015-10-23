# VERSION 	0.1
# DESCRITION: 	Atom text editor
# AUTHOR: 	Fernando Ike (fike@midstorm.org)
# COMMENTS:
#   This file describe how to install Atom. 
# USAGE:
#   # Download Atom Dockerfile
#   wget https://raw.githubusercontent.com/fike/docker-atom/master/Dockerfile
#   # Build Atom iamge
#   docker build -t atom 
#   
#   docker run --privileged -v /var/log/atom:/var/log/atom \ 
#      -v $HOME:$HOME atom -e DISPLAY=unix$DISPLAY atom
#
FROM debian:jessie

MAINTAINER Fernando Ike <fike@midstorm.org>

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update -y && \
      apt-get dist-upgrade -y

RUN apt-get install -y --no-install-recommends curl \ 
      git  \
      gconf2 \
      gconf-service \
      libgtk2.0-0 \
      libnotify4 \
      libxtst6 \ 
      libnss3 \
      python \
      gvfs-bin \
      xdg-utils 

RUN curl -k -O --location https://atom.io/download/deb && \
      mv deb atom-amd64.deb

RUN dpkg -i *.deb 

RUN rm -f atom-amd64.deb && \
      apt-get clean && \
      apt-get autoremove --purge -y && \
      rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

CMD /usr/bin/atom --foreground --log-file /var/log/atom.log && tail -f /var/log/atom.log 
