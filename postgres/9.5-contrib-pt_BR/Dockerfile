
FROM fike/postgresql:9.5

MAINTAINER Fernando Ike <fike@midstorm.org>

ENV DEBIAN_FRONTEND noninteractive

USER root

RUN apt-get update -qq &&       apt-get upgrade -y

RUN apt-get install --no-install-recommends -y       postgresql-contrib-9.5

RUN apt-get clean &&       apt-get autoremove --purge -y &&       rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

USER postgres

CMD ["/usr/lib/postgresql/9.5/bin/postgres", "-D", "/var/lib/postgresql/9.5/main", "-c", "config_file=/etc/postgresql/9.5/main/postgresql.conf"]
