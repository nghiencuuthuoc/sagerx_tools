#!/bin/bash
TIMESTAMP=$(date +"%Y%m%d_%H%M")
OUTPUT="sagerx_backup_$TIMESTAMP.sql"

echo "🔄 Dumping PostgreSQL database from container..."
docker exec -t postgres pg_dump -U sagerx sagerx > "$OUTPUT"

if [ $? -eq 0 ]; then
    echo "✅ Backup successful: $OUTPUT"
else
    echo "❌ Backup failed."
fi
