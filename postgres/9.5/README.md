# PostgreSQL based Debian Jessie

This respository is specified to use some PostgreSQL version based in a Debian 
Jessie. Here has only Dockerfiles and scripts to build containers. So, if you 
want just to use the container the Postgresql version specific, you can find
in Docker Hub. 


## Versions

The postgresql version that manteiner here are branch based:

- master -> 9.4
- 9.3
- 9.2
- 9.1 
- 9.0

## Notes

All images for default using the password "**foobar**" to *postgres* user. 
Please change password if you think to use in production and all PostgreSQL 
Dockerfiles use UTF-8 environment.

The images with 9.4, 9.3, 9.2, 9,0 version are deb packages by [PGDG](https://wiki.postgresql.org/wiki/Apt). 
The image 9.1 version is oficial Debian (Jessie) package. 

## Using Docker Hub images

**9.4**

```bash
$docker.io pull fike/debian-postgresql:9.4
```

**9.3**

```bash
$docker.io pull fike/debian-postgresql:9.3
```

###To use

```bash
# Run 

$docker.io run -d -p 0.0.0.0:5432:5432 fike/debian-postgresql:9.4

# Or run and link with another container

$docker.io run -d -p 0.0.0.0:5432:5432 --link container_id:other_container

```
