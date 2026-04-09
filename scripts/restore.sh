#!/usr/bin/env bash
set -euo pipefail

if [ $# -ne 1 ]; then
  echo "Usage: ./scripts/restore.sh <backup-file.sql>"
  exit 1
fi

BACKUP_FILE="$1"

if [ ! -f "$BACKUP_FILE" ]; then
  echo "File not found: $BACKUP_FILE"
  exit 1
fi

source .env

cat "$BACKUP_FILE" | docker exec -i wikijs-db psql -U "${POSTGRES_USER}" -d "${POSTGRES_DB}"

echo "Restore completed from: ${BACKUP_FILE}"