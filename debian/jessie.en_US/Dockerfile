FROM debian:jessie

MAINTAINER Fernando Ike <fike@mmidstorm.org>

ENV DEBIAN_FRONTEND noninteractive

RUN echo "locales locales/locales_to_be_generated multiselect en_US.UTF-8 UTF-8" | debconf-set-selections &&\
    echo "locales locales/default_environment_locale select en_US.UTF-8" | debconf-set-selections

# If you need use a specific locale, you can change commands below. e.g. en_US.UTF-8
ENV LC_ALL en_US.UTF-8

RUN  sed -i 's/httpredir.debian.org/debian-archive.trafficmanager.net/g' /etc/apt/sources.list && \
      apt-get update -y && \
      apt-get upgrade -y && \
      apt-get install --no-install-recommends --no-install-suggests locales -y && \
      apt-get clean && \
      apt-get autoremove --purge -y && \
      rm -rf /var/lib/apt/lists/* \
        /tmp/* \
        /var/tmp/* \
        /usr/share/man/??_* \
        /usr/share/man/??
