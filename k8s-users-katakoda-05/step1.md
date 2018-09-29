# ReplicaSets

1) Lancer le replicaSet définit dans le fichier '1-replicaSet.yaml' via la commande suivante:
    `kubectl apply -f replicaset.yaml`{{ execute }}

2) Observez ce qui ce produit au niveau des Pods
    `kubectl get pods -w`{{ execute }}

3) Amenez le nombre de pods à 10 au moyen de la commande suivante :
    `kubectl scale replicaset --replicas=10 myapp10-replica-set`{{ execute }}
    `kubectl get pods -w`{{ execute }}

4) Changez l'image utilisée par une autre et appliquez cela via la commande suivante:
    `sed -i.bak -e 's/alpine\:edge/nginx:latest/' replicaset.yaml`{{ execute }}
    `kubectl apply -f replicaset.yaml`{{ execute }}
    `kubectl get pods -o yaml | grep image`{{ execute }}

5) cleanup
    `kubectl delete -f replicaset.yaml`{{ execute }}