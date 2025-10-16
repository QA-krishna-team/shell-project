#!/bin/bash

# Ask user for filename
echo -n "Enter the filename: "
read filename

# Check if file exists
if [ ! -f "$filename" ]; then
  echo "File not found!"
  exit 1
fi

# Display file contents in reverse order
# 'nl' adds line numbers, 'sort -rn' sorts them in reverse, 'cut' removes line numbers
nl "$filename" | sort -rn | cut -f2-

