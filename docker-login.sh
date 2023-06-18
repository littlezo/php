#!/usr/bin/env bash
docker logout ghcr.io
docker logout docker.pkg.github.com
docker logout index.docker.io
docker login -u $DOCKER_USER -p $DOCKER_PASSWORD
