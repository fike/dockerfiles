# VERSION: 	0.3
# DESCRIPTION: 	Create the PostgreSQL 9.5 Databasee in a container 
# AUTHOR: 	Fernando Ike (fike@midstorm.org)
# COMMENTS: 
#    This file describe how to install PostgreSQL with main 
#    dependencies installed.
# USAGE:
#    # Download PostgreSQL 9.5 Dockerfile
#    wget https://raw.githubusercontent.com/fike/dockerfiles/master/debian-postgresql/9.5/Dockerfile
#    
#    # Build PostgreSQL image
#    docker build -t postgresql-9.5 
#
#    docker run -v /var/lib/postgresql/9.5:/var/lib/postgresql/9.5 \ 
#    postgresql-9.5
#
#  
FROM fike/jessie-locale:en_US

MAINTAINER Fernando Ike <fike@midstorm.org>

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update -qq && \
      apt-get upgrade -y

RUN apt-get install --no-install-recommends wget -y

RUN echo "deb http://apt.postgresql.org/pub/repos/apt/ jessie-pgdg main 9.5" > /etc/apt/sources.list.d/pgdg.list

RUN gpg --keyserver keys.gnupg.net --recv-keys ACCC4CF8

RUN gpg --export --armor ACCC4CF8|apt-key add -

RUN apt-get update && \
      apt-get install --no-install-recommends -y postgresql-9.5 \
        postgresql-client-9.5 \
        postgresql-contrib-9.5

RUN apt-get clean && \
      apt-get autoremove --purge -y && \
      apt-get remove --purge wget -y && \
      rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN  /etc/init.d/postgresql start &&\
    su postgres -c "psql --command \"ALTER USER postgres with password 'foobar';\" "

USER postgres

RUN echo "host all  all    0.0.0.0/0  md5" >> /etc/postgresql/9.5/main/pg_hba.conf

RUN echo "listen_addresses='*'" >> /etc/postgresql/9.5/main/postgresql.conf

EXPOSE 5432

VOLUME  ["/etc/postgresql", "/var/log/postgresql", "/var/lib/postgresql"]

CMD ["/usr/lib/postgresql/9.5/bin/postgres", "-D", "/var/lib/postgresql/9.5/main", "-c", "config_file=/etc/postgresql/9.5/main/postgresql.conf"]
