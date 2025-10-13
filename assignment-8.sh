#!/bin/bash

echo "Enter the file or directory name: " 
read old_name

if [ ! -e "$old_name" ]; then
    echo "Error: '$old_name' does not exist."
    exit 1
fi

new_name=$(echo "$old_name" | tr 'A-Z' 'a-z')

mv "$old_name" "$new_name"

echo "Renamed '$old_name' to '$new_name'"

