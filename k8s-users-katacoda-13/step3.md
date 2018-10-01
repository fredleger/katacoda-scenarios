## Scaling de pods - automatique

1) helm et heapster doivent être installés sur votre cluster. Validez le:

`helm ls -a`{{ execute }}

2) Appliquez le manifest `3-hpa.yaml` :

`kubectl apply -f 3-hpa.yaml`{{ execute }}

3) Que constatez vous ?

`kubectl get hpa -w`{{ execute }}
`kubectl get pods -w`{{ execute }}
`kubectl get --raw "/apis/metrics.k8s.io/v1beta1/nodes"`{{ execute }}
`htop`{{ execute }}

4) Cleanup

`kubectl delete -f 3-hpa.yaml`{{ execute }}