# NodePort

1) Démarrez le service exemple du fichier `2-nodePort.yaml`
    `kubectl apply -f 2-nodePort.yaml`{{ execute }}
    `kubectl get svc -w`{{ execute }}

2) Utilisez un pod intermédiaire pour intéroger le service comme si c'était un autre service tournant au sein du même cluster
    `kubectl run -it run1 --image=appropriate/curl -- curl -v app13`{{ execute }}

3) Pouvez vous l'atteindre depuis l'extérieur du cluster ?
   [lien](http://[[HOST_SUBDOMAIN]]-[[KATACODA_HOST]].environments.katacoda.com:80/)

4) Décrire l'intérêt que cela peux selon vous présenter

5) cleanup
    `kubectl delete -f 2-nodePort.yaml --grace-period=0`{{ execute }}
    `kubectl delete deployement run1 --grace-period=0`{{ execute }}
