#!/bin/bash

set -e -o pipefail

exec 2>&1 > $HOME/.hpa_install.log

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

echo "+ deploy heapster via helm"
helm upgrade -i --namespace kube-system \
    --set rbac.create=true --wait --recreate-pods  heapster stable/heapster

echo "+ deploy metrics-server"
helm upgrade --namespace kube-system -i --wait --recreate-pods metrics-server stable/metrics-server

echo "+ patching the metrics-server for 1.11"
export MASTERIP=$(kubectl get nodes --output=jsonpath='{range .items[*]}{.status.addresses[?(@.type=="InternalIP")].address} {.spec.podCIDR} {"\n"}{end}')
echo "guess that server ip might be : $MASTERIP"

cat <<__EOF__ | kubectl apply -n kube-system -f -
apiVersion: extensions/v1beta1
kind: Deployment
metadata:
  labels:
    app: metrics-server
    chart: metrics-server-2.0.2
    heritage: Tiller
    release: metrics-server
  name: metrics-server
  namespace: kube-system
spec:
  selector:
    matchLabels:
      app: metrics-server
      release: metrics-server
  strategy:
    rollingUpdate:
      maxSurge: 25%
      maxUnavailable: 25%
    type: RollingUpdate
  template:
    metadata:
      creationTimestamp: null
      labels:
        app: metrics-server
        release: metrics-server
    spec:
      containers:
      - command:
        - /metrics-server
        - --logtostderr
        - --kubelet-insecure-tls
        - --kubelet-preferred-address-types=--kubelet-preferred-address-types InternalIP,Hostname,InternalDNS,ExternalDNS,ExternalIP
        image: gcr.io/google_containers/metrics-server-amd64:v0.3.0
        imagePullPolicy: IfNotPresent
        name: metrics-server
        resources: {}
        terminationMessagePath: /dev/termination-log
        terminationMessagePolicy: File
      dnsPolicy: ClusterFirst
      restartPolicy: Always
      schedulerName: default-scheduler
      securityContext: {}
      serviceAccount: metrics-server
      serviceAccountName: metrics-server
      terminationGracePeriodSeconds: 30
      hostAliases:
      - hostnames:
        - master
        ip: $MASTERIP
__EOF__
