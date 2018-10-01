# Exposition de services via une Ingress Rule

1) Démarrer l'application demo via la commande `kubectl apply -f 1-ingress.yaml`{{ execute }}

2) Voir ce qui a été déployé, notamment via `kubectl get svc,ing`{{ execute }}

3) Installez traefik (un ingress controller): `helm upgrade traefik stable/traefik -i --wait --namespace kube-system --set rbac.enabled=true--set serviceType=NodePort --set service.nodePorts.http=30000`{{ execute }}

4) Testez les liens suivants:
[lien 1](http://[[HOST_SUBDOMAIN]]-30000-[[KATACODA_HOST]].environments.katacoda.com/v1)
[lien 2](http://[[HOST_SUBDOMAIN]]-30000-[[KATACODA_HOST]].environments.katacoda.com/v2)

5) Pouvez vous expliquer quel impact va avoir l'environnement cloud où est situé votre cluster sur l'Ingress déployé ? Comment y remedier ?