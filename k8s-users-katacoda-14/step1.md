## installation de helm en local

helm est disponible au téléchargement à l'adresse [suivante](https://github.com/helm/helm/releases)
il est toutefois aussi packagé dans la plupart des distributions modernes :

- brew
- apt
- chocolatey

pour la rapidité de cette exercise helm est déjà installé. Vérifiez le en tappant `helm version`{{execute}}.

## installation de helm dans votre cluster

1) création d'un service account

`kubectl apply -f helm-rbac.yaml`{{execute}}

2) installation de tiller utilisant ce service account

`helm init --service-account tiller`{{execute}}

Vous pouvez à présent vérifier au moyen de la commande `helm version`{{execute}}
