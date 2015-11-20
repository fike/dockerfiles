#!/bin/bash

RUN=()
CONTAINERS=0

build(){
for i in $(ls -1 ~/dockerfiles/postgres |egrep "[0-9]{1,2}\.[0-9]{1,2}.*") 
do 
  if [ $(($CONTAINERS % $CIRCLE_NODE_TOTAL)) -eq $CIRCLE_NODE_INDEX ]
  then
    RUN+=$i
    fi
  ((CONTAINERS=CONTAINERS+1)) 

  if [[ -e ~/container/${RUN[@]}.tar ]] 
    then docker load --input ~/container/${RUN[@]}.tar 
    fi
      docker build --rm -t fike/postgres:${RUN[@]} ~/dockerfiles/postgres/${RUN[@]} 
      mkdir -p ~/container 
      docker save --output ~/container/${RUN[@]}.tar fike/postgres:${RUN[@]}
   
done
}

run_test(){
for i in $(ls -1 ~/dockerfiles/postgres | egrep "[0-9]{1,2}\.[0-9]{1,2}.*"); 
  do docker run -d --name ${RUN[@]} fike/postgres:${RUN[@]} && 
    docker run -it --net="container:${RUN[@]}" -e PGPASSWORD="foobar" fike/postgres:${RUN[@]}  \
    psql -h 127.0.0.1 -p 5432 -U postgres --command "SELECT version();" 
    docker stop ${RUN[@]}; done
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
  
