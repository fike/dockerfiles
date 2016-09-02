#!/bin/bash 


DOWNLOAD=$(curl -k https://github.com/atom/atom/releases|sed -n -e 's/.*\(atom\/atom\/releases\/download\/v[0-9].*\/atom-amd64.deb*\).*/\1/p' | head -n1) 

echo $DOWNLOAD 

curl -k -O --location https://github.com/$DOWNLOAD
