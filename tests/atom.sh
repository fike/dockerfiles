#/bin/bash

build(){
if [[ -e ~/docker-atom/image.tar ]]  
  then 
    docker load --input ~/docker-atom/image.tar 
fi

docker build -t fike/atom ~/dockerfiles/atom

mkdir -p  ~/docker-atom 

docker save --output ~/docker-atom/image.tar fike/atom
}

run_test(){
  docker run -it --rm  fike/atom dpkg -l|grep atom | awk '{ print $3 }'
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

