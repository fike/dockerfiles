FROM debian:jessie

MAINTAINER Fernando Ike <fike@mmidstorm.org>

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update -y

# If you need use a specific locale, you can change commands below. e.g. pt_BR.UTF-8
RUN echo "locales locales/locales_to_be_generated multiselect pt_BR.UTF-8 UTF-8" | debconf-set-selections &&\
    echo "locales locales/default_environment_locale select pt_BR.UTF-8" | debconf-set-selections
RUN apt-get install --no-install-recommends locales -y

ENV LC_ALL pt_BR.UTF-8

RUN apt-get clean && \
    apt-get autoremove --purge -y && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
