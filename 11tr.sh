#!/bin/bash
if [ -z "$1" ]; then
    echo "Usage: $0 filename_or_directory"
    exit 1
fi

original="$1"
# Convert name to lowercase using 'tr'
lowercase=$(echo "$original" | tr '[:upper:]' '[:lower:]')

# Check if lowercase name already exists
if [ -e "$lowercase" ]; then
    echo "Error: '$lowercase' already exists."
    exit 1
fi
# Rename the file or directory
mv "$original" "$lowercase"
echo "Renamed '$original' to '$lowercase'"

