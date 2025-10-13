# Uptime Kuma on Railway

This repository contains the configuration to deploy Uptime Kuma on Railway.

## Deployment Instructions

1. Initialize git repository (if not already done):
   ```bash
   git init
   git add .
   git commit -m "Initial commit: Uptime Kuma Railway setup"
   ```

2. Create a new Railway service from this directory:
   ```bash
   railway link
   railway up
   ```

3. Add a volume for persistent storage:
   - Go to Railway dashboard
   - Select your Uptime Kuma service
   - Navigate to "Variables" tab
   - Add volume mount: `/app/data`

4. Set environment variables (optional):
   ```bash
   railway variables set TZ=UTC
   railway variables set UMASK=0022
   ```

5. Your Uptime Kuma instance will be available at the Railway-provided URL

## Configuration

- **Port**: 3001 (Railway will automatically expose this)
- **Data Volume**: /app/data (configure in Railway dashboard)
- **Timezone**: Set via TZ environment variable
- **File Permissions**: Set via UMASK environment variable

## Maintenance Commands

View logs:
```bash
railway logs
```

Restart service:
```bash
railway service restart
```

## Docker Compose Alternative (Local Development)

For local testing, you can use the provided docker-compose.yml:

```bash
docker-compose up -d
```

Access at: http://localhost:3001
