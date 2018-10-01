#!/bin/bash

set -e -o pipefail

exec 2>&1 > $HOME/.helm_install.log

echo "+ getting latest helm release"
curl https://raw.githubusercontent.com/helm/helm/master/scripts/get | bash

echo "+ wait for kube"
until [ "$(kubectl get nodes |tail -1 |awk '{ print $2 }')" = "Ready" ]; do
    sleep 3
done
echo "   --> kube is here !"

echo "+ helm setup"
cat <<__EOF__ | kubectl apply -f -
apiVersion: v1
kind: ServiceAccount
metadata:
  name: tiller
  namespace: kube-system
---
apiVersion: rbac.authorization.k8s.io/v1beta1
kind: ClusterRoleBinding
metadata:
  name: tiller
roleRef:
  apiGroup: rbac.authorization.k8s.io
  kind: ClusterRole
  name: cluster-admin
subjects:
  - kind: ServiceAccount
    name: tiller
    namespace: kube-system
__EOF__
helm init --service-account tiller --wait
sleep 3
echo "   --> helm is here"