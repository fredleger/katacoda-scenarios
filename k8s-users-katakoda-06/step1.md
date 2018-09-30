# ClusterIP

1) Démarrez le service exemple du fichier `1-clusterIP.yaml`
    `kubectl apply -f 1-clusterIP.yaml`{{ execute }}
    `kubectl get svc -w`{{ execute }}

2) Utilisez un pod intermédiaire pour intéroger le service comme si c'était un autre service tournant au sein du même cluster
    `kubectl run -it run1 --image=appropriate/curl -- curl -v app12`{{ execute }}


3) Pouvez vous l'atteindre depuis l'extérieur du cluster ?
    (http://[[HOST_SUBDOMAIN]]-80-[[KATACODA_HOST]].environments.katacoda.com:80/)

4) Décrire l'intérêt que cela peux selon vous présenter

5) cleanup
    `kubectl delete -f 1-clusterIP.yaml --grace-period=0`{{ execute }}
    `kubectl delete deployement run1 --grace-period=0`{{ execute }}
