# vim:set ft=dockerfile:
#
# VERSION: 	0.3
# DESCRIPTION: 	Create the PostgreSQL 9.4 Databasee in a container 
# AUTHOR: 	Fernando Ike (fike@midstorm.org)
# COMMENTS: 
#    This file describe how to install PostgreSQL with main 
#    dependencies installed.
# USAGE:
#    # Download PostgreSQL 9.4 Dockerfile
#    wget https://raw.githubusercontent.com/fike/dockerfiles/master/debian-postgresql/9.4/Dockerfile
#    
#    # Build PostgreSQL image
#    docker build -t postgresql-9.4 
#
#    docker run -v /var/lib/postgresql/9.4:/var/lib/postgresql/9.4 \ 
#    postgresql-9.4
#
#  
FROM fike/postgresql:9.4

MAINTAINER Fernando Ike <fike@midstorm.org>

ENV DEBIAN_FRONTEND noninteractive

USER root 

RUN apt-get update -qq && \
      apt-get upgrade -y

RUN apt-get install --no-install-recommends -y \ 
      postgresql-contrib-9.4 

RUN apt-get clean && \
      apt-get autoremove --purge -y && \
      rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

USER postgres

VOLUME  ["/etc/postgresql", "/var/log/postgresql", "/var/lib/postgresql"]

CMD ["/usr/lib/postgresql/9.4/bin/postgres", "-D", "/var/lib/postgresql/9.4/main", "-c", "config_file=/etc/postgresql/9.4/main/postgresql.conf"]
