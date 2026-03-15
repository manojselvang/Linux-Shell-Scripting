# A Simple Backup Script, that will check if a directory exists or not. 
# Check if enough space is there for backup. And perform a simple backup of a sample file. 
# And finally tell if the file is large or small.

#!/bin/bash

DATABASE_NAME="production_db"                           # Name of the database file
BACKUP_DATE=$(date +%Y%m%d)                             # Get current date for backup folder
BACKUP_DIR="/home/ubuntu/backup/date_$BACKUP_DATE"      # Backup directory path
BACKUP_FILE="$BACKUP_DIR/${DATABASE_NAME}_BACKUP.txt"   # Backup file name
LARGE_FILE=10000                                        # Threshold to classify large file

echo "Checking if $BACKUP_DIR directory exists"

# Check if backup directory exists
if [ -d "$BACKUP_DIR" ]; then
  echo "$BACKUP_DIR Directory Exists"
else
  echo "Creating backup directory: $BACKUP_DIR"
  mkdir -p "$BACKUP_DIR"                      # Create directory if not present
fi

echo

echo "Checking if Space is available"

# Get available disk space
AVAILABLE_SPACE=$(df / | awk 'NR==2 {print 4}')
MINIMUM_SPACE=1000                            # Minimum required space

# Check if enough disk space is available
if [ $AVAILABLE_SPACE -gt $MINIMUM_SPACE ]; then
  echo "Disk Space exists"
else
  echo "Error: Storage not enough"
  exit 1
fi

# Check if database file exists
if [ -e "$DATABASE_NAME" ]; then
  echo "Database found, Starting backup."

  cp "$DATABASE_NAME" "$BACKUP_FILE"          # Simulated backup using copy

  FILE_SIZE=$(ls -l "$BACKUP_FILE" | awk '{print $5}')  # Get file size

  # Check if file is large or small
  if [ "$FILE_SIZE" -gt "$LARGE_FILE" ]; then
    echo "Large file found"
  else
    echo "Small file found"
  fi

else
  echo "Error! Database Not found"
  exit 1
fi

echo "Backup of Database Complete"

echo "Checking if backuped file exists"

# Verify backup file creation
if [ -e "$BACKUP_FILE" ]; then
  echo "Backup file exists"
else
  echo "Backup file doesn't exists"
  exit 1
fi

# Example output

> Checking if /home/ubuntu/backup/date_20260316 directory exists
> Creating backup directory: /home/ubuntu/backup/date_20260316

> Checking if Space is available
> Disk Space exists
> Database found, Starting backup.
> Small file found
> Backup of Database Complete
> Checking if backuped file exists
> Backup file exists
