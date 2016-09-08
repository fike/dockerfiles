#!/bin/bash

BASEDIR="postgres"
TAGVERSIONS="en_US pt_BR"
BASEIMAGE="fike/debian"
AUTHOR="Fernando Ike <fike@midstorm.org>"
MAJORVERSION="9"
DEBIANVERSION="jessie"

function postgres(){
  for TAGVERSION in $(echo $TAGVERSIONS)
  do
    for MINORVERSION in $(seq 1 5)
    do 
      
      if [ "$TAGVERSION" = "en_US" ] 
      then
        unset $TAGVERSION
        FILE=$BASEDIR/$MAJORVERSION\.$MINORVERSION/Dockerfile
      else
        FILE=$BASEDIR/$MAJORVERSION\.$MINORVERSION\-$TAGVERSION/Dockerfile
      fi
      
      if [ ! -d "${FILE%/Dockerfile}" ]
      then 
        mkdir -p "${FILE%/Dockerfile}"
      fi


cat <<EOF > "$FILE" 

FROM $BASEIMAGE:$DEBIANVERSION.$TAGVERSION

MAINTAINER $AUTHOR

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update -qq && \
      apt-get upgrade -y

RUN apt-get install --no-install-recommends wget -y

RUN echo "deb http://apt.postgresql.org/pub/repos/apt/ jessie-pgdg main $MAJORVERSION.$MINORVERSION" > /etc/apt/sources.list.d/pgdg.list

RUN gpg --keyserver keys.gnupg.net --recv-keys ACCC4CF8

RUN gpg --export --armor ACCC4CF8|apt-key add -

RUN apt-get update -qq && \
      apt-get upgrade -y

RUN apt-get install --no-install-recommends -y \ 
      postgresql-$MAJORVERSION.$MINORVERSION \
      postgresql-client-$MAJORVERSION.$MINORVERSION 

RUN apt-get clean && \
      apt-get autoremove --purge -y && \
      rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN /etc/init.d/postgresql start && \
      su postgres -c "psql --command \"ALTER USER postgres with password 'foobar';\" "

RUN echo "host all  all    0.0.0.0/0  md5" >> /etc/postgresql/$MAJORVERSION.$MINORVERSION/main/pg_hba.conf

RUN echo "listen_addresses='*'" >> /etc/postgresql/$MAJORVERSION.$MINORVERSION/main/postgresql.conf

EXPOSE 5432

VOLUME  ["/etc/postgresql", "/var/log/postgresql", "/var/lib/postgresql"]

CMD ["/usr/lib/postgresql/$MAJORVERSION.$MINORVERSION/bin/postgres", "-D", "/var/lib/postgresql/$MAJORVERSION.$MINORVERSION/main", "-c", "config_file=/etc/postgresql/$MAJORVERSION.$MINORVERSION/main/postgresql.conf"]
EOF
    done
  done

}

function contrib(){
  for TAGVERSION in $(echo $TAGVERSIONS)
  do
    for MINORVERSION in $(seq 1 5)
    do

      if [ "$TAGVERSION" = "en_US" ]
      then
        unset $TAGVERSION
        FILE=$BASEDIR/$MAJORVERSION\.$MINORVERSION-contrib/Dockerfile
      else
        FILE=$BASEDIR/$MAJORVERSION\.$MINORVERSION\-contrib-$TAGVERSION/Dockerfile
      fi

      if [ ! -d "${FILE%/Dockerfile}" ]
      then
        mkdir -p "${FILE%/Dockerfile}"
      fi




cat <<EOF > "$FILE"

FROM fike/postgresql:$MAJORVERSION.$MINORVERSION

MAINTAINER Fernando Ike <fike@midstorm.org>

ENV DEBIAN_FRONTEND noninteractive

USER root

RUN apt-get update -qq && \
      apt-get upgrade -y

RUN apt-get install --no-install-recommends -y \
      postgresql-contrib-$MAJORVERSION.$MINORVERSION

RUN apt-get clean && \
      apt-get autoremove --purge -y && \
      rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

USER postgres

VOLUME  ["/etc/postgresql", "/var/log/postgresql", "/var/lib/postgresql"]

CMD ["/usr/lib/postgresql/$MAJORVERSION.$MINORVERSION/bin/postgres", "-D", "/var/lib/postgresql/$MAJORVERSION.$MINORVERSION/main", "-c", "config_file=/etc/postgresql/$MAJORVERSION.$MINORVERSION/main/postgresql.conf"]
EOF

    done
  done

}

postgres


contrib

