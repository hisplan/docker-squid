FROM alpine
MAINTAINER Jaeyoung Chun (chunj@mskcc.org)

LABEL maintainer="chunj@mskcc.org" \
      version="1.0"

RUN set -xe \
    && apk add -U squid \
    && rm -rf /var/cache/apk/*

COPY squid.conf /etc/squid/squid.conf

EXPOSE 3128 3130

CMD ["/usr/sbin/squid", "-NYCd1"]
