#!/bin/bash

set -e -o pipefail +x
#exec > intro.log 2>&1

echo "+ get scenario ressources"
wget 'https://s3.eu-west-3.amazonaws.com/com.webofmars.public/formations/katacoda/helm/sf4-animals-demo.tgz'
tar -zxvf sf4-animals-demo.tgz && rm sf4-animals-demo.tgz

# echo "+ wait for kube"
# until [ "$(kubectl get nodes 2>/dev/null |tail -1 |awk '{ print $2 }')" = "Ready" ]; do
#     echo -n '.'
#     sleep 3
# done

echo "+ finished succesfuly"
#exit 1
