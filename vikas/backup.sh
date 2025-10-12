#!/bin/bash

source_dir=$1

backup_dir=$2

mkdir -p "$backup_dir"

timestamp=$(date +%d%m%Y)

BASENAME=$(basename "$source_dir")
backup_file="$backup_dir/${BASENAME}_backup_$timestamp.tar.gz"

tar -czf "$backup_file" -C "$(dirname "$source_dir")" "$BASENAME"

echo "Backup created: $backup_file"

