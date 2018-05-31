#!/bin/bash
export GOROOT="/usr/local/go"
export GOPATH="$HOME/gocode"
export PATH="$GOPATH/bin:$GOROOT/bin:$PATH"
set -e

tag=$1
if [ -z "$tag" ]
then
    tag=latest
fi

. build.sh

docker build -t fission-bundle .
docker tag fission-bundle qianl15/fission-bundle:$tag
docker push qianl15/fission-bundle:$tag
