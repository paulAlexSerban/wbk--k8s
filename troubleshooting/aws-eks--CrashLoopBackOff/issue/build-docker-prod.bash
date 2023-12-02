#!/bin/bash
# makes sure the folder containing the script will be the root folder
cd "$(dirname "$0")" || exit

PROJECT_NAME=$(node -p "require('./package.json').name.split('/').pop()")
POJECT_VERSION=$(node -p "require('./package.json').version")

echo "Building $PROJECT_NAME:$POJECT_VERSION"

# Build the docker image
docker build --no-cache --tag "paulserbandev/$PROJECT_NAME" \
  --file Dockerfile . \
