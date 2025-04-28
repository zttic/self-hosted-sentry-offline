#!/bin/bash

if [ -z "$1" ]; then
  echo "Usage: $0 <self-hosted>"
  exit 1
fi

self_hosted=$1

docker_compose_file="$self_hosted/docker-compose.yml"
create_volumes="$self_hosted/install/create-docker-volumes.sh"

source $create_volumes

docker compose -f $docker_compose_file run  --rm web upgrade --create-kafka-topics

docker compose -f $docker_compose_file run --rm snuba-api bootstrap --force