#!/bin/bash

# Config
PG_USER=postgres
PG_PASSWORD=postgres123
PG_DB=postgres
BACKUP_DIR=/data/backups

# Choose backup file (parameter $1)
BACKUP_FILE=$1

# Validate
if [ -z "$BACKUP_FILE" ]; then
    echo "Usage: $0 <backup_file>"
    echo "Example: $0 /data/backups/postgres_20240603_020000.backup"
    exit 1
fi

if [ ! -f "$BACKUP_FILE" ]; then
    echo "ERROR: Backup file '$BACKUP_FILE' not found!"
    exit 2
fi

echo "Starting restore from $BACKUP_FILE to database $PG_DB"

docker exec postgres-primary bash -c "PGPASSWORD=${PG_PASSWORD} pg_restore -U ${PG_USER} -d ${PG_DB} -c -v /backups/$(basename ${BACKUP_FILE})"

echo "Restore completed!"
