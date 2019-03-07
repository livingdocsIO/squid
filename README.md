# squid as an http proxy

This repo serves as an example about how to set up squid in development to test applications against it.


### Example

To start the docker container that listens on port 3128.
All requests are logged to stdout. So you can use your regular tools to show them.

```bash
$ docker run -d -p 3128:3128 --name squid livingdocs/squid
$ curl -x http://localhost:3128 -i https://api.ipify.org?format=json

$ docker logs squid
2019/03/07 10:40:38| ... some squid startup logs
2019/03/07 10:40:43|    178 172.17.0.1 TCP_TUNNEL/200 4262 CONNECT google.com:443 - HIER_DIRECT/google.com -
```

To run your application against squid
```bash
HTTP_PROXY=http://localhost:3128 HTTPS_PROXY=http://localhost:3128 yourscript
```

With curl
```bash
curl -x http://localhost:3128 -i https://api.ipify.org?format=json
```
