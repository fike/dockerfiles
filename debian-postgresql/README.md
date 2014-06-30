# PostgreSQL 9.4 beta (Debian Wheezy) base

This is PostgreSQL 9.4 beta version based in Debian Wheezy.

If you want to test the PostgreSQL 9.4, you can download using Docker Hub.

```bash
$docker.io pull fike/debian-postgresql-9.4
```

The postgres user default password is 'foobar'. If you think to use this 
container in production, please change the password directly this dockerfile 
and rebuild container.

```bash
# Rebuild container
$docker.io build --rm --no-cache -t="debian-postgresql-9.4" .
```
###To use

```bash
# Run 
$docker.io run -d -p 0.0.0.0:5432:5432 debian-postgresql-9.4

# Or run and link with another container
$docker.io run -d -p 0.0.0.0:5432:5432 --link debian-postgresql-9.4:other_container
```
