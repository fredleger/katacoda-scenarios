# externalName

1) Démarrez le service exemple du fichier `4-externalName.yaml`
    `kubectl apply -f 4-externalName.yaml`{{ execute }}
    `kubectl get svc -w`{{ execute }}

2) Utilisez un pod intermédiaire pour intéroger le service comme si c'était un autre service tournant au sein du même cluster
    `kubectl run -it run1 --image=ubuntu:latest -- curl app15`{{ execute }}

3) Pouvez vous l'atteindre depuis l'extérieur du cluster ?
    [lien](http://[[HOST_SUBDOMAIN]]-[[KATACODA_HOST]].environments.katacoda.com/)

4) Décrire l'intérêt que cela peux selon vous présenter

5) cleanup
    `kubectl delete -f 4-externalName.yaml --grace-period=0`{{ execute }}
    `kubectl delete deployement run1 --grace-period=0`{{ execute }}