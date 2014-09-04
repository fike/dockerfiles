# DNS server based BIND9 based Debian Wheezy

Here has Dockerfile to build DNS server using BIND9 and Debian Wheezy. 
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
#sudo docker run -d -p 53:53/udp -p 53:53 fike/bind9
```

### Modifying

The example zone is site.com and references IP are like XXX.XXX.XXX.XXX. You need change them to what you want use. 

To modify, you have know what's container ID. Below a example how get container ID.

```bash
fike@klatoon:~$ docker ps |grep bind9 | awk '{ print $1 }'
6505af8ba692
fike@klatoon:~$ 
```

### Running

```bash
$docker run -i -t --net="container:CONTAINERID" --volumes-from CONTAINERID dns.p.o.b /bin/bash
```

The default, this container doens't have a editor software. My favorite is the **vim**.

```bash
#apt-get install vim -y
```

The files that you need change are:

- /etc/bind/named.conf.local 
- /etc/bind/zones/db.site.com  
- /etc/bind/zones.site.master

