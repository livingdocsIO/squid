FROM alpine:3.7

RUN apk add --no-cache squid tini sudo
RUN echo 'squid ALL=(ALL) NOPASSWD: ALL' >> /etc/sudoers
RUN ln -sf /dev/stdout /var/log/squid/access.log
ADD ./squid.conf /etc/squid/squid.conf
USER squid

ENTRYPOINT ["/sbin/tini", "-g", "--"]
CMD ["sudo", "squid", "-NYCd", "1"]
