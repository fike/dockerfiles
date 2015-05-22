# VERSION:      0.3
# DESCRIPTION:  Create the PostgreSQL 9.4 Database in a container 
# AUTHOR:       Fernando Ike (fike@midstorm.org)
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

FROM fike/ubuntu-locales:pt_BR

MAINTAINER Fernando Ike de Oliveira <fike@midstorm.org>

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update -qq && apt-get upgrade -y

RUN apt-get install postgresql-9.4 postgresql-client-9.4 postgresql-contrib-9.4 -y

RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/

USER postgres

RUN  /etc/init.d/postgresql start &&\
    psql --command "ALTER USER postgres with password 'foobar';"

RUN echo "host all  all    0.0.0.0/0  md5" >> /etc/postgresql/9.4/main/pg_hba.conf

RUN echo "listen_addresses='*'" >> /etc/postgresql/9.4/main/postgresql.conf

EXPOSE 5432

VOLUME  ["/etc/postgresql", "/var/log/postgresql", "/var/lib/postgresql"]

CMD ["/usr/lib/postgresql/9.4/bin/postgres", "-D", "/var/lib/postgresql/9.4/main", "-c", "config_file=/etc/postgresql/9.4/main/postgresql.conf"]

