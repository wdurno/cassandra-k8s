gcloud beta compute disks create ${DISK_NAME} \
	--project=gdax-dnn \
	--type=pd-standard \
	--size=10GB \
	--zone=us-central1-c \
	--physical-block-size=4096
