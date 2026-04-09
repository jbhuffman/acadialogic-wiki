#!/usr/bin/env bash
set -euo pipefail

TIMESTAMP="$(date +%Y-%m-%d_%H-%M-%S)"
BACKUP_DIR="./backups"
BACKUP_FILE="${BACKUP_DIR}/wikijs_${TIMESTAMP}.sql"

mkdir -p "${BACKUP_DIR}"

source .env

docker exec -t wikijs-db pg_dump -U "${POSTGRES_USER}" -d "${POSTGRES_DB}" > "${BACKUP_FILE}"

echo "Backup created: ${BACKUP_FILE}"