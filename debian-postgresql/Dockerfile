# PostgreSQL 9.4 beta
#
#
# 
FROM debian:wheezy

MAINTAINER Fernando Ike de Oliveira <fike@midstorm.org>

ENV DEBIAN_FRONTEND noninteractive

ADD start /start

RUN chmod 755 /start

RUN apt-get update -qq

RUN apt-get install wget -qq

RUN echo "deb http://apt.postgresql.org/pub/repos/apt/ wheezy-pgdg main 9.4" > /etc/apt/sources.list.d/pgdg.list

RUN gpg --keyserver keys.gnupg.net --recv-keys ACCC4CF8

RUN gpg --export --armor ACCC4CF8|apt-key add -

RUN apt-get update

# If you need use a specific locale, you can change commands below. e.g. pt_BR.UTF-8
RUN echo "locales locales/locales_to_be_generated multiselect pt_BR.UTF-8 UTF-8" | debconf-set-selections &&\
    echo "locales locales/default_environment_locale select pt_BR.UTF-8" | debconf-set-selections

RUN apt-get install locales -qq

ENV LC_ALL pt_BR.UTF-8

RUN apt-get install postgresql-9.4 postgresql-client-9.4 postgresql-contrib-9.4 -y

RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN  /etc/init.d/postgresql start &&\
    su postgres -c "psql --command \"ALTER USER postgres with password 'foobar';\" "

RUN echo "host all  all    0.0.0.0/0  md5" >> /etc/postgresql/9.4/main/pg_hba.conf

RUN echo "listen_addresses='*'" >> /etc/postgresql/9.4/main/postgresql.conf

EXPOSE 5432

VOLUME  ["/etc/postgresql", "/var/log/postgresql", "/var/lib/postgresql"]

CMD ["/start"]
