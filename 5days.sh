#!/bin/bash

TARGET_DIR="/home/ec2-user/shell-project"

DAYS=30   
echo "Searching files in $TARGET_DIR older than $DAYS days..."

# Find old files, sort by size (largest first), and delete
find "$TARGET_DIR" -type f -mtime +$DAYS -printf "%s %p\n" | \
    sort -nr | \
    while read size file; do
        echo "Deleting: $file (Size: $size bytes)"
        rm -f "$file"
    done
echo "Cleanup complete!"

