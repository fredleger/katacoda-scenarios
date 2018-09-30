#!/bin/bash

set +x

echo -n 'Waiting after kubernetes spin-up '
until [ "$(kubectl get nodes 2>/dev/null |tail -1 |awk '{ print $2 }')" = "Ready" ]; do
    echo -n '.'
    sleep 3
done
echo ' \o/'
