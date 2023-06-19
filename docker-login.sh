#!/usr/bin/env bash
docker logout ghcr.io
docker logout docker.pkg.github.com
docker logout index.docker.io

echo $USERNAME
echo $PASSWORD
echo $HOST

docker login -u $USERNAME -p $PASSWORD $HOST
