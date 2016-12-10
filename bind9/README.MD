# DNS server based BIND9 based Debian Jessie

Here has Dockerfile to build DNS server using BIND9 and Debian Jessie.
Do you can download and build yourself or you can download by Docker Hub.

## Using

My Docker Hub repository build automatically BIND9 container using here as source. So, you can do download its and use.

### Download

```bash
$docker.io pull fike/bind9
```

### Running

Attention here, DNS servers use low port number (<1024) and you just run as root user.

```bash
#sudo docker run -d \
  --name bind9 \
  -p 53:53/udp \
  -p 53:53 \
  -v zones:/etc/bind9/zones \
  -v named.conf.local:/etc/bind9/named.conf.local \
  fike/bind9
```

### Modifying

```bash
$docker run -i -t --net="container:bind9" --volumes-from bind9 dns.p.o.b /bin/bash
```

The default, this container doens't have a editor software. My favorite is the **vim**.

```bash
#apt-get install vim -y
```

The files that you need change are:

- /etc/bind/named.conf.local
- /etc/bind/zones/db.site.com  
- /etc/bind/zones.site.master
