#!/usr/bin/env bash

# Builds image and add a descriptive tag
# This file tags and uploads an image to Docker Hub
docker build -t header-parser-microservice .

# Create dockerpath
dockerpath=ceoehis/header-parser-microservice

# Authenticate & tag
echo "Docker ID and Image: $dockerpath"
echo "$DOCKER_HUB_PASSWORD" | docker login --username $DOCKER_HUB_USERNAME --password-stdin
docker tag header-parser-microservice:latest ${dockerpath}:latest

# Push image to a docker repository
docker push $dockerpath
