# CLAUDE.md

This file provides context for AI assistants working on this repository.

## Project Overview

This is a **deployment configuration repository** for running [Uptime Kuma](https://github.com/louislam/uptime-kuma) on [Railway](https://railway.app). It does not contain application source code — it wraps the upstream `louislam/uptime-kuma:latest` Docker image with Railway-specific configuration and helper scripts.

Uptime Kuma is a self-hosted monitoring tool (similar to "Uptime Robot"). This repo provides everything needed to deploy it to Railway's cloud platform with persistent storage.

## Repository Structure

```
uptime-kuma-railway/
├── Dockerfile              # Minimal — extends louislam/uptime-kuma:latest, exposes port 3001
├── railway.json            # Railway platform config (Dockerfile builder, start command, restart policy)
├── docker-compose.yml      # Local development/testing with Docker Compose
├── deploy-railway.sh       # Interactive script guiding Railway deployment (CLI or manual)
├── setup-github.sh         # Interactive script to push repo to GitHub
├── README.md               # Primary readme with deployment instructions
├── DEPLOYMENT_GUIDE.md     # Detailed step-by-step deployment walkthrough
├── QUICK_START.md          # Abbreviated 3-step deployment guide
└── .gitignore              # Ignores data/, node_modules/, .env, *.log
```

## Key Architecture Details

- **Base image**: `louislam/uptime-kuma:latest` — all application logic lives in the upstream image
- **Port**: 3001 (hardcoded in Uptime Kuma; Railway auto-exposes it)
- **Start command**: `node server/server.js` (defined in `railway.json`)
- **Data persistence**: Volume mounted at `/app/data` (must be configured in Railway dashboard)
- **Restart policy**: `ON_FAILURE` with max 10 retries (defined in `railway.json`)
- **Healthcheck** (docker-compose only): `curl -f http://localhost:3001` every 30s

## Environment Variables

| Variable | Default | Purpose |
|----------|---------|---------|
| `TZ` | `UTC` | Timezone for the container |
| `UMASK` | `0022` | File permission mask |
| `PORT` | `3001` | Railway binds to this automatically |

## Development Workflows

### Local Testing

```bash
docker-compose up -d
# Access at http://localhost:3001
docker-compose down
```

### Deploying to Railway

Two paths:
1. **Dashboard**: Push to GitHub, then deploy from Railway dashboard (see `DEPLOYMENT_GUIDE.md`)
2. **CLI**: Use `railway link` and `railway up` (see `deploy-railway.sh`)

### Making Changes

Since this is a deployment wrapper, most changes involve:
- Updating `Dockerfile` (e.g., pinning a specific Uptime Kuma version instead of `latest`)
- Adjusting `railway.json` (deploy settings, restart policy)
- Modifying `docker-compose.yml` (local dev environment tweaks)
- Updating documentation

## Conventions

- **Shell scripts** use `#!/bin/bash`, include descriptive headers, and use `read -p` for interactive prompts
- **Docker Compose** uses version `"3.8"` format
- **Git branching**: `main` is the primary branch
- **No application code**: Never add Uptime Kuma source files — the upstream Docker image handles everything
- **Secrets**: `.env` files are gitignored; environment variables should be set via Railway dashboard or CLI, never committed

## Common Pitfalls

- Forgetting to add a Railway volume at `/app/data` causes data loss on redeployment
- The `Dockerfile` is intentionally minimal — the upstream image already sets the entrypoint
- `deploy-railway.sh` and `setup-github.sh` are interactive (use `read`) and require a TTY
- Using `docker-compose` version may trigger deprecation warnings — `docker compose` (v2, no hyphen) is the modern equivalent

## Upstream References

- Uptime Kuma source: https://github.com/louislam/uptime-kuma
- Uptime Kuma Docker Hub: https://hub.docker.com/r/louislam/uptime-kuma
- Railway docs: https://docs.railway.app
