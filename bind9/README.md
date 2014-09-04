# DNS server based BIND9 based Debian Wheezy

Here has Dockerfile to build DNS server using BIND9 and Debian Wheezy. 
Do you can download and build yourself or you can download by Docker Hub.

## Using

My Docker Hub repository build automatically BIND9 container using here as source. So, you can do download its and use.

### Download

```bash
$docker.io pull fike/bind9
```

### Runing
```bash
#sudo docker run -d -p 53:53/udp -p 53:53 fike/bind9
```

### Modifying
```bash
$docker run -i -t --net="container:CONTAINERID" --volumes-from CONTAINERID dns.p.o.b /bin/bash
```
