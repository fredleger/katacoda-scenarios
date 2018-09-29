# Deployments

1) Lancer le deployment définit dans le fichier '2-deployment.yaml' via la commande suivante:
    `kubectl apply -f deployment.yaml`{{ execute }}

2) Observez ce qui ce produit au niveau des Pods
    `kubectl get pods -w`{{ execute }}

3) amenez le nombre de pods à 10 au moyen de la commande suivante:
    `kubectl scale replicaset --replicas=10 myapp11-deploy`{{ execute }}
    `kubectl get pods -w`{{ execute }}

4) Remplacez l'image utilisée par une autre et appliquez le:
    `kubectl edit deployment myapp11-deploy`{{ execute }}
    `kubectl get pods -o yaml -w | grep image:`{{ execute }}

5) Incrémentez la version affichée de 1 puis de 2 en la déployant à chaque fois.
    `kubectl edit deployment myapp11-deploy`{{ execute }}

6) Puis revenez en arrière au moyen de la commande suivante:
    `kubectl rollout history deployment myapp11-deploy`{{ execute }}
    `kubectl rollout undo deployment myapp11-deploy --to-revision=1`{{ execute }}
    `kubectl get pods -o yaml | grep image:`{{ execute }}
