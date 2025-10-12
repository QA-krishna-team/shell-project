#!/bin/bash
if [ -z "$1" ]; then
    echo "Usage: $0 filename"
    exit 1
fi
file="$1"
if [ ! -f "$file" ]; then
    echo "Error: File '$file' does not exist."
    exit 1
fi

# Read file into an array
mapfile -t lines < "$file"
total=${#lines[@]}
# Print lines in reverse order
for ((i=total-1; i>=0; i--)); do
    echo "${lines[i]}"
done

