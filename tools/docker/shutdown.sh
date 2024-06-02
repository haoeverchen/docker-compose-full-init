#!/bin/bash

cd $(dirname "$(realpath "$0")")

if ! docker-compose down; then
  echo "Failed to shut down Docker containers."
  exit 1
fi

echo "Docker containers have been shut down."
