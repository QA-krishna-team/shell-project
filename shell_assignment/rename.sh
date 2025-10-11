#!/bin/bash

name="$1"

if [ -z "$1" ]; then
  echo "Usage: $0 <name>"
  exit 1
fi

if [ ! -e "$name" ]; then
  echo "Error: File or Directory '$name' not found"
  exit 1
fi

new_name=$(echo "$name" | tr '[:upper:]' '[:lower:]')

if [ "$name" != "$new_name" ]; then
  mv "$name" "$new_name"
  echo "Renamed '$name' to '$new_name'"
else
  echo "File or Directory name is already in lowercase"
fi

