#!/bin/bash

# --- CONFIGURATION ---
SOURCE_DIR="/home/node1/Homelab"
BACKUP_DIR="/home/node1/backups"
RETENTION_DAYS=7
TIMESTAMP=$(date +"%Y-%m-%d_%H-%M-%S")
BACKUP_NAME="backup_$TIMESTAMP.tar.gz"

# --- EXECUTION ---
mkdir -p "$BACKUP_DIR"

tar -czf "$BACKUP_DIR/$BACKUP_NAME" -C "$(dirname "$SOURCE_DIR")" "$(basename "$SOURCE_DIR")"

if [ $? -eq 0 ]; then
    echo "[$TIMESTAMP] Backup successful: $BACKUP_NAME"
    find "$BACKUP_DIR" -type f -name "backup_*.tar.gz" -mtime +$RETENTION_DAYS -delete
else
    echo "[$TIMESTAMP] ERROR: Backup failed!" >&2
    exit 1
fi

