#!/bin/bash

DIR="$1"

AGE_DAYS="$2"  

echo "Finding files older than $AGE_DAYS days in $DIR..."

find "$DIR" -type f -mtime +"$AGE_DAYS" -exec ls -lhS {} + | awk '{print $9, $5}' | while read file size; do
    echo "Deleting $file ($size)"
    rm -f "$file"
done

echo "Cleanup complete."

