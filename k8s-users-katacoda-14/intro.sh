#!/bin/bash

# start kube as soon as possible
launch.sh

echo "+ get scenario ressources"
wget 'https://s3.eu-west-3.amazonaws.com/com.webofmars.public/formations/katacoda/helm/sf4-animals-demo.tgz'
tar -zxvf sf4-animals-demo.tgz && rm sf4-animals-demo.tgz

echo "+ finished succesfuly"
