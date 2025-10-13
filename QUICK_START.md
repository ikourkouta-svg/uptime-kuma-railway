# Uptime Kuma Railway - Quick Start

## 🚀 Quick Deployment (3 Steps)

### 1. Push to GitHub
```bash
cd ~/uptime-kuma-railway
./setup-github.sh
```
Or manually:
- Create repo at https://github.com/new (name: `uptime-kuma-railway`)
- Push code:
  ```bash
  git remote add origin https://github.com/YOUR_USERNAME/uptime-kuma-railway.git
  git branch -M main
  git push -u origin main
  ```

### 2. Deploy to Railway
- Go to https://railway.app/dashboard
- Click **"New Project"** → **"Deploy from GitHub repo"**
- Select `uptime-kuma-railway`
- Wait ~3-5 minutes for build

### 3. Configure (Important!)

**Add Volume (Required for data persistence):**
1. Service → Settings → Volumes
2. Click "New Volume"
3. Mount Path: `/app/data`
4. Click "Add"

**Generate Domain:**
1. Service → Settings → Networking
2. Click "Generate Domain"
3. Access your Uptime Kuma at the provided URL!

## 📋 Optional Configuration

**Environment Variables:**
- `TZ`: `UTC` (or your timezone)
- `UMASK`: `0022`

**Custom Domain:**
- Service → Settings → Networking → "Add Custom Domain"
- Add CNAME record to your DNS

## 📚 Files Overview

- `Dockerfile` - Docker configuration
- `railway.json` - Railway settings
- `docker-compose.yml` - Local testing
- `DEPLOYMENT_GUIDE.md` - Detailed instructions
- `setup-github.sh` - GitHub push helper
- `deploy-railway.sh` - Deployment helper

## 🔧 Useful Commands

```bash
# View Railway logs
railway logs

# Check status
railway status

# Restart service
railway service restart

# Test locally with Docker
docker-compose up -d
```

## 🆘 Troubleshooting

**Build fails?**
- Check Railway build logs
- Verify Dockerfile syntax

**Can't access URL?**
- Wait 1-2 minutes after deployment
- Check if domain is generated
- Verify service is running (green status)

**Data not persisting?**
- Ensure volume is mounted at `/app/data`
- Restart service after adding volume

## 📖 Documentation

- Full Guide: `DEPLOYMENT_GUIDE.md`
- Railway Docs: https://docs.railway.app
- Uptime Kuma: https://github.com/louislam/uptime-kuma

## 🎯 Expected Result

After successful deployment:
- ✅ Service running on Railway
- ✅ Public URL available
- ✅ Data persisting in volume
- ✅ Uptime Kuma setup wizard ready

Access your instance at:
`https://uptime-kuma-production-xxxx.up.railway.app`
