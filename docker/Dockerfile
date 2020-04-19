FROM ubuntu:18.04 

ADD app /app 

RUN chmod +x /app/entrypoint.sh && \
apt-get update && \
apt install python3-pip -y && \
pip3 install cassandra-driver 

WORKDIR /app

ENTRYPOINT /bin/bash /app/entrypoint.sh 

