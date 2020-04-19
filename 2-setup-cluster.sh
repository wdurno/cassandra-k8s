source config.sh 
scripts/spin-up-cluster.sh
kubectl apply -f kubernetes/cassandra-service.yaml
kubectl apply -f kubernetes/cassandra-statefulset.yaml
cat kubernetes/controller-pod.yaml | envsubst | kubectl apply -f -
