#!/bin/bash

build(){
for i in $(ls -1 ~/dockerfiles/postgres |egrep "[0-9]{1,2}\.[0-9]{1,2}.*") 
do 
   if [[ -e ~/container/$i.tar ]] 
     then docker load --input ~/container/$i.tar 
     fi
       docker build --rm -t fike/postgres:$i ~/dockerfiles/postgres/$i 
       mkdir -p ~/container 
       docker save --output ~/container/$i.tar fike/postgres:$i 
done
}

run_test(){
for i in $(ls -1 ~/dockerfiles/postgres | egrep "[0-9]{1,2}\.[0-9]{1,2}.*"); 
  do docker run -d --name $i fike/postgres:$i && 
    docker run -it --net="container:$i" -e PGPASSWORD="foobar" fike/postgres:$i  \
      psql -h 127.0.0.1 -p 5432 -U postgres --command "SELECT version();" 
    docker stop $i; done
}

case "$1" in
  "build")
    build
    ;;
  "run_test")
    run_test
    ;;
  *)
    echo "Please, use a argument: build or run_test"
    exit 1
  ;;
esac
  
