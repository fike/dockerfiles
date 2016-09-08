#!/bin/bash

RUN=()
CONTAINERS=0
VERSIONS=$(ls -1 ~/dockerfiles/postgres |egrep "[0-9]{1,2}\.[0-9]{1,2}.*"|sort)

for i in $(echo $VERSIONS)
do
  if [ $(($CONTAINERS % $CIRCLE_NODE_TOTAL)) -eq $CIRCLE_NODE_INDEX ]
  then
    RUN+=" $i"
    fi
  ((CONTAINERS=CONTAINERS+1))

done



build(){

for y in $(echo ${RUN[@]})
do
  if [[ -e ~/container/$y.tar ]]
  then 
    docker load --input ~/container/$y.tar
   fi
      docker build --rm -t fike/postgres:$y ~/dockerfiles/postgres/$y 
      mkdir -p ~/container 
      docker save --output ~/container/$y.tar fike/postgres:$y
done

}

run_test(){
for y in $(echo ${RUN[@]}); 
  do docker run -d --name $y fike/postgres:$y && 
    docker run -it --net="container:$y" -e PGPASSWORD="foobar" fike/postgres:$y  \
    psql -h 127.0.0.1 -p 5432 -U postgres --command "SELECT version();" 
    docker stop $y; done
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
  
