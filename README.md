# cassandra-k8s

Deploys Cassandra robustly to Kubernetes with persistent disks. Persistent disks persist data between cluster instances. This repo demonstrates that robustness. 

#### Demo 

Run this demo from GCP cloud shell.

1. Build a Docker image with `./build.sh`. 
2. Copy the Docker image tag and unique hash into `config.sh`. 
3. Allocate persistent disks with `./1-get-persistent-disks.sh`. 
4. Deploy containers into Kubernetes with `./2-setup-cluster.sh`.
5. Ping your cluster with `kubectl get pods`. Once it is done setting-up, write and read some data to Cassandra with `./3-write-read.sh`. You should see a result like `Row(id=UUID('c3b6f6f4-8285-11ea-aa41-8a09d96d0573'), first_name='Kurt', last_name='Godel')`.
6. To illustrate robustness, simulate a complete cluster failure with `./4-release-resources.sh`. 
7. Simulate a cluster reboot with `./5-reinitialize.sh`.
8. Once done redeploying, read data from Cassandra with `./6-read.sh`. You should see a result like `Row(id=UUID('c3b6f6f4-8285-11ea-aa41-8a09d96d0573'), first_name='Kurt', last_name='Godel')`. Congratulations, you've executed a complete data recovery. 
9. It's time to clean up. Delete your cluster with `./7-clean-up-cluster.sh`.
10. Now delete your disks with `./8-clean-up-disks.sh`.

