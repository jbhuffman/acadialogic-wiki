# AcadiaLogic Wiki

Self-hosted Wiki.js stack for internal and partner-facing documentation.

## Stack

- Wiki.js
- PostgreSQL
- Caddy reverse proxy

## Structure

- `docker-compose.yml` - main stack definition
- `.env` - local environment variables for Compose
- `config/wikijs.env` - Wiki.js application environment
- `caddy/Caddyfile` - reverse proxy config
- `scripts/` - bootstrap, backup, restore
- `docs/` - architecture and operational notes

## Startup

```bash
docker compose up -d

## Bootstrap
```bash
./scripts/bootstrap.sh

## Backup
```bash
./scripts/backup.sh

## Restore
```bash
./scripts/restore.sh backups/<file>.sql

---

## Content for your markdown placeholders

### `docs/architecture.md`

```md
# Architecture

## Overview
This stack hosts Wiki.js for internal and partner-facing project documentation.

## Components
- Wiki.js application container
- PostgreSQL database container
- Caddy reverse proxy on host/VPS

## DNS
- `docs.acadialogic.io` points to the VPS public IP

## Data
- PostgreSQL data persisted at `/srv/appdata/wikijs-db`

## Access Model
- Admin users: internal only
- Partner users: scoped access to relevant spaces/pages
- Future client access: optional, per client
