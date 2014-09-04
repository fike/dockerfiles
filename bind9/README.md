# DNS server based BIND9 based Debian Wheezy

Here has Dockerfile to build DNS server using BIND9 and Debian Wheezy. 
Do you can download and build yourself or you can download by Docker Hub.

## Using



```bash
$docker.io pull fike/bind9


#sudo docker run -d -p 53:53/udp -p 53:53 fike/bind9
```


```bash
$docker run -i -t --net="container:afdb86e8fcf9" --volumes-from afdb86e8fcf9 dns.p.o.b /bin/bash

```
