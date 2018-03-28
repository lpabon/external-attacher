#!/bin/sh

NAME=csi-attacher
TAG=v0.2.0
CONTAINER=quay.io/k8scsi/${NAME}:${TAG}
APP=csi-attacher

docker build --rm -f Dockerfile.builder -t ${NAME}:builder .
docker run --rm --privileged -v $PWD:/host ${NAME}:builder cp /go/bin/${APP} /host/${APP}
sudo chown $USER ${APP}
docker build --rm -t ${CONTAINER} .
docker rmi ${NAME}:builder
rm -f ${APP}
