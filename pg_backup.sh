#!/bin/bash

# Config
PG_USER=postgres
PG_PASSWORD=postgres123
PG_DB=postgres
BACKUP_DIR=/data/backups

# Create backup filename
BACKUP_FILE=${BACKUP_DIR}/${PG_DB}_$(date +%Y%m%d_%H%M%S).backup

# Run backup
echo "Starting backup to $BACKUP_FILE"

docker exec postgres-primary bash -c "PGPASSWORD=${PG_PASSWORD} pg_dump -U ${PG_USER} -F c -b -v -f /backups/$(basename ${BACKUP_FILE}) ${PG_DB}"

echo "Backup completed: $BACKUP_FILE"
