# squid as an http proxy

This repo serves as an example about how to set up squid in development to test applications against it.


### Example

To start the docker container that listens on port 3128.

```bash
./squid.sh start
```

To show all the http requests that are done against squid
```bash
./squid.sh logs
```

To run your application against squid
```bash
HTTP_PROXY=http://localhost:3128 HTTPS_PROXY=http://localhost:3128 yourscript
```

With curl
```bash
HTTP_PROXY=http://localhost:3128 HTTPS_PROXY=http://localhost:3128 curl -i https://api.ipify.org?format=json
```
