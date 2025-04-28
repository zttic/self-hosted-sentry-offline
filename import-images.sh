#!/bin/bash

# check if the image folder path is provided
if [ -z "$1" ]; then
  echo "Usage: $0 <path_to_image_folder>"
  exit 1
fi

# get the image folder path
image_folder="$1"

# check if the directory exists
if [ ! -d "$image_folder" ]; then
  echo "Error: Directory $image_folder does not exist."
  exit 1
fi

# import all .tar files
for image_file in "$image_folder"/*.tar; do
  if [ -f "$image_file" ]; then
    echo "Importing $image_file"
    docker load -i "$image_file"
  fi
done

echo "All images have been imported from $image_folder"
