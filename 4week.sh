#!/bin/bash
if [ $# -ne 2 ]; then
    echo "Usage: $0 <source_directory> <backup_directory>"
    exit 1
fi

SOURCE_DIR="$1"
BACKUP_DIR="$2"

# Check if source exists
if [ ! -d "$SOURCE_DIR" ]; then
    echo "Error: Source directory '$SOURCE_DIR' not found!"
    exit 1
fi

mkdir -p "$BACKUP_DIR"

# Create backup filename with timestamp
TIMESTAMP=$(date +"%Y-%m-%d_%H-%M-%S")
BACKUP_FILE="$BACKUP_DIR/backup-$TIMESTAMP.tar.gz"

# Create the tar.gz backup
tar -czf "$BACKUP_FILE" -C "$SOURCE_DIR" .

if [ -f "$BACKUP_FILE" ]; then
    echo " Backup created successfully: $BACKUP_FILE"
else
    echo " Backup failed!"
fi

