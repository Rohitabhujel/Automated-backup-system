#!/bin/bash

# Define source and backup directories
SOURCE_DIR="/home/ubuntu/scripts"          
BACKUP_DIR="/home/ubuntu/backups/$(date +%Y-%m-%d)" 
LOG_FILE="/home/ubuntu/backup.log" 

# Perform the backup using rsync
rsync -av --delete "$SOURCE_DIR/" "$BACKUP_DIR/" >> "$LOG_FILE" 2>&1

# Log backup status
if [ $? -eq 0 ]; then
    echo "$(date +'%Y-%m-%d %H:%M:%S') - Backup successful" >> "$LOG_FILE"
else
    echo "$(date +'%Y-%m-%d %H:%M:%S') - Backup failed" >> "$LOG_FILE"
fi

