FROM debian:stretch

LABEL MAINTAINER "Fernando Ike <fike@maburix.com>"

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update -y && \
      apt-get upgrade -y && \
      apt-get install -y --no-install-recommends  \ 
          --no-install-suggests \
            curl

ENTRYPOINT [ "curl" ]

CMD [ "--help" ]
