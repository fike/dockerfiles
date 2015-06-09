FROM ubuntu:vivid

MAINTAINER Fernando Ike de Oliveira <fike@midstorm.org>

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update -qq && apt-get upgrade -y

RUN apt-get install language-pack-en -y

RUN update-locale LANG=en_US.UTF-8 LC_MESSAGES=POSIX

RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/

CMD locale
