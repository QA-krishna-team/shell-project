#!/bin/bash

# Directory to back up (change this path)
SOURCE_DIR="/home/ec2-user/mydata"

# Directory where backup files will be stored
BACKUP_DIR="/home/ec2-user/backups"

# Create backup directory if not exists
mkdir -p "$BACKUP_DIR"

# Get current date and time for version naming
TIMESTAMP=$(date '+%Y-%m-%d_%H-%M')

# Create backup filename
BACKUP_FILE="$BACKUP_DIR/backup-$TIMESTAMP.tar.gz"

# Get current day of week (1=Monday ... 7=Sunday)
DAY_OF_WEEK=$(date +%u)

# Check if today is Saturday (6) or Sunday (7)
if [ "$DAY_OF_WEEK" -ge 6 ]; then
    echo "Starting weekend backup..."
    tar -czf "$BACKUP_FILE" "$SOURCE_DIR"
    echo "Backup completed successfully: $BACKUP_FILE"
else
    echo "Today is not a weekend. Skipping backup."
fi

