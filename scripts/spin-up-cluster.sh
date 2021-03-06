gcloud beta container \
	--project "gdax-dnn" \
	clusters create "cassandra-demo-cluster" \
	--zone "us-central1-c" \
	--no-enable-basic-auth \
	--cluster-version "1.14.10-gke.27" \
	--machine-type "n1-standard-2" \
	--image-type "COS" \
	--disk-type "pd-standard" \
	--disk-size "100" \
	--metadata disable-legacy-endpoints=true \
	--scopes "https://www.googleapis.com/auth/devstorage.read_only","https://www.googleapis.com/auth/logging.write","https://www.googleapis.com/auth/monitoring","https://www.googleapis.com/auth/servicecontrol","https://www.googleapis.com/auth/service.management.readonly","https://www.googleapis.com/auth/trace.append" \
	--num-nodes "3" \
	--enable-stackdriver-kubernetes \
	--enable-ip-alias \
	--network "projects/gdax-dnn/global/networks/default" \
	--subnetwork "projects/gdax-dnn/regions/us-central1/subnetworks/default" \
	--default-max-pods-per-node "110" \
	--no-enable-master-authorized-networks \
	--addons HorizontalPodAutoscaling,HttpLoadBalancing \
	--enable-autoupgrade \
	--enable-autorepair

