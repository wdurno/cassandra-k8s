source config.sh
kubectl apply -f kubernetes/persistent-volumes.yaml
kubectl apply -f kubernetes/cassandra-service.yaml
kubectl apply -f kubernetes/cassandra-statefulset.yaml
cat kubernetes/controller-pod.yaml | envsubst | kubectl apply -f -
