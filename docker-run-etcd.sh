#!/bin/sh

set -e

CONTAINER_NAME=etcd
IMAGE_NAME=etcd:v3.2.28

# Clear the previous container
docker rm -f ${CONTAINER_NAME} >/dev/null 2>&1 || true

docker run --rm -it -d -p 2379:2379 -p 2380:2380  \
    --mount type=bind,source=/tmp/etcd-data.tmp,destination=/etcd-data \
    --name ${CONTAINER_NAME} \
    gcr.io/etcd-development/${IMAGE_NAME} \
    /usr/local/bin/etcd \
    --name ${CONTAINER_NAME} \
    --data-dir /etcd-data \
    --listen-client-urls http://0.0.0.0:2379 \
    --advertise-client-urls http://0.0.0.0:2379 \
    --listen-peer-urls http://0.0.0.0:2380 \
    --initial-advertise-peer-urls http://0.0.0.0:2380 \
    --initial-cluster ${CONTAINER_NAME}=http://0.0.0.0:2380 \
    --initial-cluster-token tkn \
    --initial-cluster-state new
