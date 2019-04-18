#!/bin/bash

set -e -o pipefail
exec > intro.log 2>&1

echo "+ unzipping ressources"
wget 'https://s3.eu-west-3.amazonaws.com/com.webofmars.public/formations/katacoda/helm/sf4-animals-demo.tgz'
tar -zxvf sf4-animals-demo.tgz

echo "+ finished succesfuly"
exit 1
