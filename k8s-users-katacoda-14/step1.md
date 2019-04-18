# Initial Setup

## installation de helm en local

helm est disponible au téléchargement à l'adresse [suivante](https://github.com/helm/helm/releases)
il est toutefois aussi packagé dans la plupart des distributions modernes :

- brew
- apt
- chocolatey

pour la rapidité de cette exercise helm est déjà installé. Vérifiez le en tappant `helm version`{{execute}}.

## installation de helm dans votre cluster

*création d'un service account*

```sh
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
```{{execute}}

*installation de tiller utilisant ce service account*
`helm init --service-account tiller`{{execute}}