#!/bin/bash

# Configuration
CONTAINER_NAME="postgres"
DB_USER="sagerx"
DB_NAME="sagerx"
BACKUP_FILE="sagerx_backup.sql"

# Step 1: Check if backup file exists
if [ ! -f "$BACKUP_FILE" ]; then
    echo "❌ Backup file '$BACKUP_FILE' not found!"
    exit 1
fi

# Step 2: Restore the backup
echo "🔁 Restoring database from $BACKUP_FILE..."
cat "$BACKUP_FILE" | docker exec -i "$CONTAINER_NAME" psql -U "$DB_USER" -d "$DB_NAME"

if [ $? -ne 0 ]; then
    echo "❌ Restore failed."
    exit 2
fi

echo "✅ Restore completed."

# Step 3: Check available tables
echo "📋 Checking tables in $DB_NAME..."
docker exec -i "$CONTAINER_NAME" psql -U "$DB_USER" -d "$DB_NAME" -c "\dt"

# Step 4: Try selecting from the first available table (optional, dynamic)
FIRST_TABLE=$(docker exec -i "$CONTAINER_NAME" psql -U "$DB_USER" -d "$DB_NAME" -t -c "\dt" | awk 'NR==1{print $3}')
if [ -n "$FIRST_TABLE" ]; then
    echo "🔍 Previewing 5 rows from table: $FIRST_TABLE"
    docker exec -i "$CONTAINER_NAME" psql -U "$DB_USER" -d "$DB_NAME" -c "SELECT * FROM $FIRST_TABLE LIMIT 5;"
else
    echo "⚠️ No tables found."
fi
