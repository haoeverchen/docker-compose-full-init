#!/bin/bash

script_dir=$(dirname "$(realpath "$0")")
echo "Script directory: $script_dir"

cd "$script_dir"
docker kill backend_demo

# Build .jar with Maven
cd "$script_dir"/../../backend
if ! mvn clean install; then
  echo "Maven build failed, exiting."
  exit 1
fi

# Build and start the Docker containers
cd "$script_dir"
echo "Returned to script directory for Docker Compose: $(pwd)"
if ! docker-compose up -d; then
  echo "Docker Compose failed to start, exiting."
  exit 1
fi

# container bash
if ! docker exec -it backend_demo /bin/bash; then
  echo "Failed to enter backend_demo container, it may not be running."
  exit 1
fi