# VERSION: 	0.3
# DESCRIPTION: 	Create the PostgreSQL 9.0 Databasee in a container 
# AUTHOR: 	Fernando Ike (fike@midstorm.org)
# COMMENTS: 
#    This file describe how to install PostgreSQL with main 
#    dependencies installed.
# USAGE:
#    # Download PostgreSQL 9.0 Dockerfile
#    wget https://raw.githubusercontent.com/fike/dockerfiles/master/debian-postgresql/9.0/Dockerfile
#    
#    # Build PostgreSQL image
#    docker build -t postgresql-9.0 
#
#    docker run -v /var/lib/postgresql/9.0:/var/lib/postgresql/9.0 \ 
#    postgresql-9.0
#
#  
FROM debian:jessie

MAINTAINER Fernando Ike <fike@midstorm.org>

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update -qq

RUN apt-get install wget -qq

RUN echo "deb http://apt.postgresql.org/pub/repos/apt/ trusty-pgdg main 9.0" > /etc/apt/sources.list.d/pgdg.list

RUN gpg --keyserver keys.gnupg.net --recv-keys ACCC4CF8

RUN gpg --export --armor ACCC4CF8|apt-key add -

RUN apt-get update -qq

# If you need use a specific locale, you can change commands below. e.g. en_US.UTF-8
RUN echo "locales locales/locales_to_be_generated multiselect en_US.UTF-8 UTF-8" | debconf-set-selections &&\
    echo "locales locales/default_environment_locale select en_US.UTF-8" | debconf-set-selections

RUN apt-get install locales -qq

ENV LC_ALL en_US.UTF-8

RUN apt-get install postgresql-9.0 postgresql-client-9.0 postgresql-contrib-9.0 -y

RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN  /etc/init.d/postgresql start &&\
    su postgres -c "psql --command \"ALTER USER postgres with password 'foobar';\" "

USER postgres

RUN echo "host all  all    0.0.0.0/0  md5" >> /etc/postgresql/9.0/main/pg_hba.conf

RUN echo "listen_addresses='*'" >> /etc/postgresql/9.0/main/postgresql.conf

EXPOSE 5432

VOLUME  ["/etc/postgresql", "/var/log/postgresql", "/var/lib/postgresql"]

CMD ["/usr/lib/postgresql/9.0/bin/postgres", "-D", "/var/lib/postgresql/9.0/main", "-c", "config_file=/etc/postgresql/9.0/main/postgresql.conf"]
