#!/bin/bash

script_dir=$(dirname "$(realpath "$0")")
echo "Script directory: $script_dir"

# Build .jar
cd "$script_dir"/../../
if ! mvn clean install; then
  echo "Maven build failed, exiting."
  exit 1
fi
docker kill backend
# Build docker compose
cd "$script_dir"
echo "Returned to script directory for Docker Compose: $(pwd)"
if ! docker-compose up -d --build; then
  echo "Docker Compose failed to start, exiting."
  exit 1
fi

# container bash
if ! docker exec -it backend /bin/bash; then
  echo "Failed to enter backend container, it may not be running."
  exit 1
fi