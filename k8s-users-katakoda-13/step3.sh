#!/bin/bash

echo -n 'Waiting after kubernetes spin-up '
until [ "$(kubectl get nodes |tail -1 |awk '{ print $2 }')" = "Ready" ]; do
    echo -n '.'
    sleep 3
done
echo ' \o/'

