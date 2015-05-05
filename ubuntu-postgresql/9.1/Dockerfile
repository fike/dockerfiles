# VERSION:      0.3
# DESCRIPTION:  Create the PostgreSQL 9.1 Database in a container 
# AUTHOR:       Fernando Ike (fike@midstorm.org)
# COMMENTS: 
#    This file describe how to install PostgreSQL with main 
#    dependencies installed.
# USAGE:
#    # Download PostgreSQL 9.1 Dockerfile
#    wget https://raw.githubusercontent.com/fike/dockerfiles/master/debian-postgresql/9.1/Dockerfile
#    
#    # Build PostgreSQL image
#    docker build -t postgresql-9.1 
#
#    docker run -v /var/lib/postgresql/9.1:/var/lib/postgresql/9.1 \ 
#    postgresql-9.1
#
#   

FROM ubuntu:vivid

MAINTAINER Fernando Ike de Oliveira <fike@midstorm.org>

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update -qq

RUN apt-get install wget -qq

RUN echo "deb http://apt.postgresql.org/pub/repos/apt/ trusty-pgdg main 9.1" > /etc/apt/sources.list.d/pgdg.list

RUN gpg --keyserver keys.gnupg.net --recv-keys ACCC4CF8

RUN gpg --export --armor ACCC4CF8|apt-key add -

RUN apt-get update 

# If you use another language, change the package. e.g. language-pack-es
# and run update-locale with language variable.
RUN apt-get install language-pack-en -y

RUN update-locale LANG=en_US.UTF-8 LC_MESSAGES=POSIX

RUN apt-get install postgresql-9.1 postgresql-client-9.1 postgresql-contrib-9.1 -y

RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/

USER postgres

RUN  /etc/init.d/postgresql start &&\
    psql --command "ALTER USER postgres with password 'foobar';"

RUN echo "host all  all    0.0.0.0/0  md5" >> /etc/postgresql/9.1/main/pg_hba.conf

RUN echo "listen_addresses='*'" >> /etc/postgresql/9.1/main/postgresql.conf

RUN sed -i 's/ssl\ =\ true/\ssl\ =\ false/g' /etc/postgresql/9.1/main/postgresql.conf

EXPOSE 5432

VOLUME  ["/etc/postgresql", "/var/log/postgresql", "/var/lib/postgresql"]

CMD ["/usr/lib/postgresql/9.1/bin/postgres", "-D", "/var/lib/postgresql/9.1/main", "-c", "config_file=/etc/postgresql/9.1/main/postgresql.conf"]

