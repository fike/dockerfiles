
FROM fike/debian:jessie.pt_BR

MAINTAINER Fernando Ike <fike@midstorm.org>

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update -qq &&       apt-get upgrade -y

RUN apt-get install --no-install-recommends wget -y

RUN echo "deb http://apt.postgresql.org/pub/repos/apt/ jessie-pgdg main 9.3" > /etc/apt/sources.list.d/pgdg.list

RUN gpg --keyserver keys.gnupg.net --recv-keys ACCC4CF8

RUN gpg --export --armor ACCC4CF8|apt-key add -

RUN apt-get update -qq &&       apt-get upgrade -y

RUN apt-get install --no-install-recommends -y \ 
      postgresql-9.3       postgresql-client-9.3 

RUN apt-get clean &&       apt-get autoremove --purge -y &&       rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN /etc/init.d/postgresql start &&       su postgres -c "psql --command \"ALTER USER postgres with password 'foobar';\" "

RUN echo "host all  all    0.0.0.0/0  md5" >> /etc/postgresql/9.3/main/pg_hba.conf

RUN echo "listen_addresses='*'" >> /etc/postgresql/9.3/main/postgresql.conf

EXPOSE 5432

USER postgres

VOLUME  ["/etc/postgresql", "/var/log/postgresql", "/var/lib/postgresql"]

CMD ["/usr/lib/postgresql/9.3/bin/postgres", "-D", "/var/lib/postgresql/9.3/main", "-c", "config_file=/etc/postgresql/9.3/main/postgresql.conf"]
