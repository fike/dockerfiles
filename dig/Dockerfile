# Bind9
#
#
#
FROM debian:jessie

MAINTAINER Fernando Ike de Oliveira <fike@midstorm.org>

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update -y && \
      apt-get upgrade -y && \
      apt-get install -y --no-install-recommends \
        --no-install-suggests \
        dnsutils

RUN mkdir -p /var/run/named /etc/bind/zones && \
      chmod 775 /var/run/named && \
      chown root:bind /var/run/named > /dev/nul 2>&1

COPY zones /etc/bind/zones

COPY name.conf.local /etc/bind/name.conf.local

RUN apt-get clean && \
      apt-get autoremove --purge -y && \
      rm -rf /var/lib/apt/lists/* \
        /tmp/* \
        /var/tmp/* \
        /usr/share/man/??_* \
        /usr/share/man/??

VOLUME ["/etc/bind", "/var/cache/bind", "/var/lib/bind", "/var/log", "/var/run/named"]

EXPOSE 53

CMD ["/usr/sbin/named", "-g", "-c", "/etc/bind/named.conf", "-u", "bind"]
