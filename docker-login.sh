#!/usr/bin/env bash
docker logout ghcr.io
docker logout docker.pkg.github.com
docker logout index.docker.io

echo $ACR_USERNAME
echo $ACR_TOKEN
echo $ACR_REGISTRY
echo $ACR_NAMESPACE
docker login -u $ACR_USERNAME -p $ACR_TOKEN $ACR_REGISTRY
