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

RUN apt-get update -qq

RUN apt-get install wget curl git gconf2 gconf-service libgtk2.0-0 libnotify4 libxtst6 libnss3 python gvfs-bin xdg-utils -y -qq

RUN DOWNLOAD=$(curl -s https://github.com/atom/atom/releases|sed -n -e 's/.*\(atom\/atom\/releases\/download\/v[0-9].*\/atom-amd64.deb*\).*/\1/p' | head -n1) && wget -c https://github.com/$DOWNLOAD

RUN dpkg -i atom-amd64.deb 

RUN rm -f atom-amd64.deb

CMD /usr/bin/atom --foreground --log-file /var/log/atom.log && tail -f /var/log/atom.log 
