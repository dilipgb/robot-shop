#!/bin/sh

# set -x

oc project robot-shop


for DFILE in $(find . -name Dockerfile -print)
do
    # multiple images
        iname=$(basename -- "$(dirname -- "$DFILE")")
        echo "$iname"
        changed="$iname"
        echo "Building $iname image"
        cd $changed
        docker build -f Dockerfile -t robot-shop/rs-$iname:latest .
        sleep 10
        cd ..
done






