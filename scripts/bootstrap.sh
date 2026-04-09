#!/usr/bin/env bash
set -euo pipefail

echo "Starting AcadiaLogic Wiki stack..."

docker compose pull
docker compose up -d

echo
echo "Containers:"
docker compose ps

echo
echo "Wiki.js should be available on port 3000 locally."
echo "If Caddy is configured, check https://docs.acadialogic.io"