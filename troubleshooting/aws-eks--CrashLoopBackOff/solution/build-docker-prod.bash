#!/bin/bash
# makes sure the folder containing the script will be the root folder
cd "$(dirname "$0")" || exit

PROJECT_NAME=$(node -p "require('./package.json').name.split('/').pop()")
POJECT_VERSION=$(node -p "require('./package.json').version")

echo "Building $PROJECT_NAME:$POJECT_VERSION"

# Build the docker image
# --platform linux/amd64  is needed for building on M1 Macs (ARM) and pushing to Docker Hub (x86) to work properly on AWS EKS (x86) and AWS ECS (x86)
docker build  --no-cache --tag "paulserbandev/$PROJECT_NAME" \
              --file Dockerfile . \
              --platform linux/amd64