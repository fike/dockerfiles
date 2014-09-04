# Bind9
#
#
#
FROM debian:wheezy

MAINTAINER Fernando Ike de Oliveira <fike@midstorm.org>

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update -qq

# If you need use a specific locale, you can change commands below. e.g. pt_BR.UTF-8
RUN echo "locales locales/locales_to_be_generated multiselect en_US.UTF-8 UTF-8" | debconf-set-selections &&\
    echo "locales locales/default_environment_locale select en_US.UTF-8" | debconf-set-selections

RUN apt-get install locales bind9 -qq

ENV LC_ALL en_US.UTF-8

RUN apt-get clean

RUN mkdir -p /var/run/named /etc/bind/zones

RUN chmod 775 /var/run/named

RUN chown root:bind /var/run/named > /dev/nul 2>&1

ADD zones.pgbr.master /etc/bind/zones.pgbr.master

ADD db.site.com /etc/bind/zones/db.site.com

ADD named.conf.local /etc/bind/named.conf.local

VOLUME ["/etc/bind", "/var/cache/bind", "/var/lib/bind", "/var/log", "/var/run/named"]

EXPOSE 53

CMD ["/usr/sbin/named", "-g", "-c", "/etc/bind/named.conf", "-u", "bind"]
