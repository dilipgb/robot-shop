#!/bin/sh

for DFILE in $(find . -name Dockerfile -print)
do
    # multiple images
    for IMAGE in $(awk '/^FROM/ { print $2 }' $DFILE)
    do
        echo "Pulling $IMAGE"
        docker pull $IMAGE
    done
done


docker pull docker.io/s390x/rabbitmq:3.7-management-alpine
docker pull docker.io/s390x/redis:4.0.6