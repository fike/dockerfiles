FROM ubuntu:vivid

MAINTAINER Fernando Ike de Oliveira <fike@midstorm.org>

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update -qq && apt-get upgrade -y

# If you use another language, change the package. e.g. language-pack-es
# and run update-locale with language variable.
RUN apt-get install language-pack-pt -y

RUN update-locale LANG=pt_BR.UTF-8 LC_MESSAGES=POSIX

RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/

CMD locale
