FROM alpine
MAINTAINER Jaeyoung Chun (chunj@mskcc.org)

LABEL maintainer="chunj@mskcc.org" \
      version="1.0"

RUN set -xe \
    && apk add -U squid \
    && rm -rf /var/cache/apk/*

RUN sed -i "1iacl localnet src ::1  # IPv6 localhost" /etc/squid/squid.conf
RUN sed -i "1iacl localnet src 127.0.0.1 # localhost" /etc/squid/squid.conf
RUN sed -i "1iacl Safe_ports port 8000" /etc/squid/squid.conf
RUN sed -i "1iacl Safe_ports port 9003" /etc/squid/squid.conf
RUN sed -i "1idns_v4_first on" /etc/squid/squid.conf


RUN echo 'request_header_add X-Mskcc-Username "chunj" all' >> /etc/squid/squid.conf
RUN sed -i "s/http_access deny/#http_access deny/g" /etc/squid/squid.conf
RUN echo 'http_access allow all' >> /etc/squid/squid.conf


EXPOSE 3128 3130

CMD ["/usr/sbin/squid", "-NYCd1"]