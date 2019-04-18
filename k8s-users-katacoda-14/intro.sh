#!/bin/bash

set -e -o pipefail
exec > intro.log 2>&1

echo "+ unzipping ressources"
tar -zxvf sf4-animals-demo.tgz

echo "+ finished succesfuly"
exit 1
