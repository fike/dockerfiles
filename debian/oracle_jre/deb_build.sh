#!/bin/bash

CURL=$(which curl)
CURL_PAR_CHECK="-s -I"
URL="http://javadl.sun.com/webapps/download/AutoDL?BundleId=111681"
SED=$(which sed)
SED_PAR="-n -e"
DPKG=$(which dpkg)
DOCKER=$(which docker)
BUILDDIR=$HOME/java

version(){
REMOTE_VERSION=$($CURL $CURL_PAR_CHECK $URL| $SED $SED_PAR 's/.*\([0-9]u[0-9]*\).*/\1/p' 2> /dev/null)
LOCAL_VERSION=$($DPKG -l|grep oracle | awk '{ print $3 }')
}

get_java(){
  if [[ ! -d $BUILDDIR ]]
  then 
    mkdir $BUILDDIR
  fi
 echo "Downloading new java version."
 $CURL -s -O --location $URL
}


check_version(){
 version 
 if [[ $REMOTE_VERSION != $LOCAL_VERSION ]] 
  then
    echo "Java isn't installed as package, downloading new version."
    get_java
 fi
 break
}

build(){ 
  check_version 
  JRE_FILE=$(find $BUILDDIR -maxdepth 1 -name "jre*.tar.gz" -print | sort | tail -n 1)
  echo "Building Oracle JRE package"
  $DOCKER run -it -v $HOME/java:/home/builder/java fike/debian:ora-jre fakeroot make-jpkg $JRE_FILE  
}
  

if [[ ! -d $HOME/java ]]; 
then
  echo "Creating build java package directory." 
  mkdir $HOME/java 
fi
  

build
