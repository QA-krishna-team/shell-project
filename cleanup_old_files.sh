#!/bin/bash

# Directory to clean (change path as needed)
TARGET_DIR="/home/ec2-user/mydata"

# Find files older than 28 days (4 weeks)
# Sort them by size (largest first), then delete one by one
echo "Deleting files in $TARGET_DIR older than 4 weeks..."

find "$TARGET_DIR" -type f -mtime +28 -printf "%s %p\n" | sort -nr | while read size file
do
    echo "Deleting $file (size: $size bytes)"
    rm -f "$file"
done

echo "Cleanup completed."

