#!/bin/bash

# check if the docker-compose file path is provided
if [ -z "$1" ] || [ -z "$2" ]; then
  echo "Usage: $0 <path_to_docker_compose_file> <export_directory>"
  exit 1
fi

# get the docker-compose file path and export directory
compose_file="$1"
export_dir="$2"

# check if the file exists
if [ ! -f "$compose_file" ]; then
  echo "Error: File $compose_file does not exist."
  exit 1
fi

# create the export directory
mkdir -p "$export_dir"

# get all the service configurations and extract the image names
images=$(docker-compose -f "$compose_file" config | grep 'image:' | awk '{print $2}' | sort -u)

# export the images
for image in $images; do
  echo "Exporting $image"
  repo=$(echo "$image" | cut -d: -f1 | tr '/' '_')
  tag=$(echo "$image" | cut -d: -f2 | tr '/' '_')
  docker save -o "$export_dir/$repo-$tag.tar" "$image"
done

echo "All unique images have been exported to $export_dir"
