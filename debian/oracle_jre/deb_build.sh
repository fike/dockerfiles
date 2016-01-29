#!/bin/bash

# Copyright (c) 2015 Fernando Ike <fike@midstorm.org>.
# Licensed to the Apache Software Foundation (ASF) under one
# or more contributor license agreements.  See the NOTICE file
# distributed with this work for additional information
# regarding copyright ownership.  The ASF licenses this file
# to you under the Apache License, Version 2.0 (the
# "License"); you may not use this file except in compliance
# with the License.  You may obtain a copy of the License at
#
#   http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing,
# software distributed under the License is distributed on an
# "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
# KIND, either express or implied.  See the License for the
# specific language governing permissions and limitations
# under the License.
# 

# This script allow automation the build Debian package of Oracle JRE,  
# it depends the Docker Engine to works. The files are in $HOME/java 
# directory, as tarball files as debian package. 
# IMPORTANT: You still need to accept license term to finish 
# the building.
#


CURL=$(which curl)
CURL_PAR_CHECK="-s -I"
SED=$(which sed)
SED_PAR="-n -e"
UNIQ=$(which uniq)
DPKG=$(which dpkg)
DOCKER=$(which docker)
BUILDDIR="/home/builder/java"
JAVA_WORK_DIR="$HOME/java"
#URL="http://javadl.sun.com/webapps/download/AutoDL?BundleId=114681"
URL=$($CURL -s "http://java.com/en/download/linux_manual.jsp" | $SED $SED_PAR 's/.*\(a\stitle\=.*\sLinux\sx64\".*\).*\(http:\/\/javadl\.sun.com\/webapps\/download\/AutoDL?BundleId\=[0-9]\{6\}\).*/\2/p'| $UNIQ)
#curl -s  http://java.com/en/download/linux_manual.jsp | sed -n -e 's/.*\(a\stitle\=.*\sLinux\sx64\".*\).*\(http:\/\/javadl\.sun.com\/webapps\/download\/AutoDL?BundleId\=[0-9]\{6\}\).*/\2/p'| uniq


function version(){

REMOTE_VERSION=$($CURL $CURL_PAR_CHECK $URL| $SED $SED_PAR 's/.*\(jre\-[0-9]u[0-9].*\-linux\-x64\.tar\.gz*\).*/\1/p' 2> /dev/null)
NUMBER_VERSION=$(echo $REMOTE_VERSION | $SED $SED_PAR 's/.*\([0-9]u[0-9]*\).*/\1/p')
LOCAL_VERSION=$($DPKG -l|grep oracle | awk '{ print $3 }')
}

get_java(){
  if [[ ! -d $JAVA_WORK_DIR ]]
  then 
    mkdir $JAVA_WORK_DIR
  fi
 echo "Downloading new java version."
 $CURL -L -C - -s $URL -o $JAVA_WORK_DIR/$REMOTE_VERSION 
}


function check_version(){
  version 
  if [[ $NUMBER_VERSION != $LOCAL_VERSION ]] 
  then
    echo "Java isn't installed as package, downloading new version."
    get_java
  else
    echo "Oracle JRE version installed is the same the upstream site."
    exit 0
  fi
}

function build(){ 
  check_version 
  JRE_FILE=$(find $JAVA_WORK_DIR -maxdepth 1 -name "jre*.tar.gz" -printf '%P\n' | sort | tail -n 1)
  echo "Building Oracle JRE package"
  $DOCKER run -it -v $JAVA_WORK_DIR:$BUILDDIR fike/debian:ora-jre fakeroot make-jpkg $JRE_FILE  
}
  

build
