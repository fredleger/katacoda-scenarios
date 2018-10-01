# Strategies de mise à jour

Une des stratégie de mise à jour les plus utilisées est certainement le rolling update.

Dans ce scénario vous allez déplo

1) Déployez le manifest `1-rolling-update.yaml`:

`kubectl apply -f 1-rolling-update.yaml`{{ execute }}

2) Afficher le détails avec `kubectl get all`{{ execute }}


3) Tester le service (port 8080)

[lien](http://[[HOST_SUBDOMAIN]]-[[KATACODA_HOST]].environments.katacoda.com/)

4) Upgrader l'image de base vers `v2` et appliquez. Que constatez vous ?

`kubectl apply -f 1-rolling-update.yaml`{{ execute }}
`kubectl get pods -o yaml | grep image:`{{ execute }}

5) Upgrader l'image vers `v10` et appliquez. Que constatez vous ?

`kubectl apply -f 1-rolling-update.yaml`{{ execute }}
`kubectl get pods -o yaml | grep image:`{{ execute }}
`kubectl get deployments`{{ execute }}

Normalement vous devriez voir un upgrade en erreur qui va conserver le service.

1) Testez les commandes suivantes :

`kubectl rollout history deployment myapp24-deploy`{{ execute }}
`kubectl rollout undo deployment myapp24-deploy`{{ execute }}

7) Concluez

8) Cleanup

`kubectl delete -f 1-rolling-update.yaml`{{ execute }}

