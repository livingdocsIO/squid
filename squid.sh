#!/usr/bin/env bash
set -eu

if [ $1 = "start" ]; then
   docker run -d --name squid --rm -v $PWD/squid.conf:/etc/squid3/squid.conf -p 3128:3128 sameersbn/squid:3.3.8-23 -d1
fi

if [ $1 = "logs" ]; then
   docker exec squid cat /var/log/squid3/access.log
fi

