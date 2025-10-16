#!/bin/bash

# Step 1: Check if the user provided a file or directory name
if [ $# -ne 1 ]; then
    echo "Usage: $0 <file_or_directory>"
    exit 1
fi

OLD_NAME="$1"

# Step 2: Check if the file or directory exists
if [ ! -e "$OLD_NAME" ]; then
    echo "Error: '$OLD_NAME' does not exist."
    exit 1
fi

# Step 3: Convert the name to lowercase
NEW_NAME=$(echo "$OLD_NAME" | tr '[:upper:]' '[:lower:]')

# Step 4: Rename the file or directory
if [ "$OLD_NAME" != "$NEW_NAME" ]; then
    mv "$OLD_NAME" "$NEW_NAME"
    echo "Renamed '$OLD_NAME' to '$NEW_NAME'."
else
    echo "No uppercase letters found. Name unchanged."
fi

