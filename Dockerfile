FROM alpine:edge

RUN apk add --no-cache squid tini
RUN ln -sf /dev/stdout /var/log/squid/access.log
RUN chmod 777 /var/run
ADD ./squid.conf /etc/squid/squid.conf
USER squid

ENTRYPOINT ["/sbin/tini", "-g", "--"]
CMD ["squid", "-NYCd", "1"]
