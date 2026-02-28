# CLAUDE.md — AI Assistant Guide for uptime-kuma-railway

## Project Overview

This repository is a **deployment wrapper** for [Uptime Kuma](https://github.com/louislam/uptime-kuma), an open-source monitoring tool. It does **not** contain application source code — it provides Docker and Railway configuration to deploy the upstream `louislam/uptime-kuma:latest` image on [Railway](https://railway.app).

## Repository Structure

```
uptime-kuma-railway/
├── Dockerfile              # Thin layer over louislam/uptime-kuma:latest (exposes port 3001)
├── railway.json            # Railway build & deploy config (Dockerfile builder, node server/server.js start command)
├── docker-compose.yml      # Local development / testing with Docker Compose
├── deploy-railway.sh       # Interactive bash script guiding Railway deployment
├── setup-github.sh         # Interactive bash script to push repo to GitHub
├── README.md               # Main README with deployment instructions
├── DEPLOYMENT_GUIDE.md     # Step-by-step Railway deployment walkthrough
├── QUICK_START.md          # Condensed quick-start guide
└── .gitignore              # Ignores data/, node_modules/, .env, *.log
```

### Key files at a glance

| File | Purpose | When to modify |
|---|---|---|
| `Dockerfile` | Base image + port exposure | Pinning a specific Uptime Kuma version, adding custom packages |
| `railway.json` | Railway platform config (builder, start command, restart policy) | Changing deploy behavior, build settings |
| `docker-compose.yml` | Local Docker Compose stack with volume, healthcheck, logging | Adjusting local dev environment |
| `deploy-railway.sh` | Deployment helper script (interactive) | Adding/changing deployment steps |
| `setup-github.sh` | GitHub repo push helper (interactive) | Changing GitHub workflow |

## Architecture & Key Concepts

- **No application code lives here.** The Dockerfile pulls `louislam/uptime-kuma:latest` — all app logic comes from the upstream image.
- **Railway is the target platform.** `railway.json` drives the build (Dockerfile builder) and deploy (start command: `node server/server.js`, restart on failure with max 10 retries).
- **Port 3001** is the application port. Railway auto-exposes it.
- **Persistent data** lives at `/app/data` — must be backed by a Railway volume or a Docker volume locally.
- **Environment variables:** `TZ` (timezone, default `UTC`) and `UMASK` (file permissions, default `0022`) are the main configurable vars.

## Development Workflow

### Local testing

```bash
docker-compose up -d          # Start locally
# Access at http://localhost:3001
docker-compose down            # Stop
```

### Deploying to Railway

Two paths:
1. **Dashboard:** Push to GitHub, then deploy from Railway dashboard (recommended — see `DEPLOYMENT_GUIDE.md`)
2. **CLI:** `railway link && railway up` (requires `@railway/cli`)

### Making changes

Since this is a deployment config repo, changes typically involve:
- Updating the Dockerfile (e.g., pinning a version, adding packages)
- Modifying `railway.json` (deploy settings, restart policies)
- Adjusting `docker-compose.yml` for local dev
- Updating documentation

## Conventions & Guidelines

### Git
- Default branch: `main`
- Commit messages should be descriptive and imperative (e.g., "Pin Uptime Kuma to v1.23.0")
- The `.gitignore` excludes `data/`, `node_modules/`, `.env`, and `*.log` — never commit these

### Shell scripts
- Both `deploy-railway.sh` and `setup-github.sh` are interactive (use `read -p`) — they cannot be run non-interactively
- Scripts use `#!/bin/bash` and basic POSIX-compatible constructs
- Scripts include safety checks (e.g., verifying correct directory, checking for CLI tools)

### Docker
- The Dockerfile intentionally stays minimal — a thin wrapper over the upstream image
- Do not add application-level customizations to the Dockerfile unless strictly necessary
- The upstream image's entrypoint is used as-is

### Documentation
- `README.md` is the entry point; keep it concise
- `DEPLOYMENT_GUIDE.md` has detailed step-by-step instructions
- `QUICK_START.md` is the condensed version
- Keep all three docs in sync when changing deployment procedures

## Important Notes for AI Assistants

1. **Do not add application code.** This repo is deployment config only. Uptime Kuma source lives at `louislam/uptime-kuma`.
2. **No build tools, no package.json, no tests.** There is nothing to `npm install` or test in this repo.
3. **The two shell scripts are interactive** and cannot be executed in non-interactive environments.
4. **When modifying the Dockerfile**, keep it minimal. The upstream image handles everything.
5. **When updating `railway.json`**, validate against the Railway schema (`https://railway.app/railway.schema.json`).
6. **Volume mount path `/app/data`** is critical for data persistence — never change this without updating all documentation.
7. **Port 3001** is hardcoded in the upstream image — do not change it.
