# Uptime Kuma Railway Deployment Guide

## Step 1: Create GitHub Repository

### Option A: Via GitHub Web Interface
1. Go to https://github.com/new
2. Repository name: `uptime-kuma-railway`
3. Description: "Uptime Kuma monitoring tool deployed on Railway"
4. Set to Public or Private (your choice)
5. **Do NOT** initialize with README (we already have one)
6. Click "Create repository"

### Option B: Via GitHub CLI (if installed)
```bash
cd ~/uptime-kuma-railway
gh repo create uptime-kuma-railway --public --source=. --remote=origin --push
```

## Step 2: Push to GitHub (if using Option A)

After creating the repository, run these commands:

```bash
cd ~/uptime-kuma-railway
git remote add origin https://github.com/YOUR_USERNAME/uptime-kuma-railway.git
git branch -M main
git push -u origin main
```

Replace `YOUR_USERNAME` with your GitHub username.

## Step 3: Deploy to Railway via Dashboard

1. **Go to Railway Dashboard**
   - Visit: https://railway.app/dashboard
   - Click "New Project"

2. **Deploy from GitHub**
   - Click "Deploy from GitHub repo"
   - Select your `uptime-kuma-railway` repository
   - Railway will automatically detect the Dockerfile

3. **Wait for Build**
   - Railway will build the Docker image
   - Monitor the build logs in the dashboard
   - This may take 3-5 minutes

## Step 4: Configure Persistent Storage

1. **Add Volume**
   - Click on your deployed service
   - Go to "Settings" tab
   - Scroll to "Volumes" section
   - Click "New Volume"
   - Mount Path: `/app/data`
   - Click "Add"

2. **Restart Service** (if needed)
   - The service will automatically restart after adding volume

## Step 5: Set Environment Variables (Optional)

In the Railway dashboard:
1. Click on your service
2. Go to "Variables" tab
3. Add these variables:
   - `TZ`: `UTC` (or your timezone like `America/New_York`)
   - `UMASK`: `0022`
4. Click "Add" for each variable

## Step 6: Enable Public Access

1. **Generate Domain**
   - In your service → "Settings" tab
   - Scroll to "Networking" section
   - Click "Generate Domain"
   - Your Uptime Kuma will be accessible at: `https://uptime-kuma-production-xxxx.up.railway.app`

2. **Custom Domain** (Optional)
   - Click "Add Custom Domain"
   - Enter your domain (e.g., `uptime.yourdomain.com`)
   - Add the CNAME record to your DNS provider

## Step 7: Access Uptime Kuma

1. Open the Railway-provided URL in your browser
2. You'll see the Uptime Kuma setup wizard
3. Create your admin account
4. Start monitoring your services!

## Alternative: Deploy via Railway CLI

If you have interactive terminal access:

```bash
cd ~/uptime-kuma-railway

# Link to Railway project
railway link

# Deploy
railway up

# Set variables
railway variables set TZ=UTC
railway variables set UMASK=0022

# Check status
railway status
```

## Troubleshooting

### Build Fails
- Check the Railway build logs
- Ensure Dockerfile is correct
- Verify Railway can access your GitHub repo

### Can't Access URL
- Wait 1-2 minutes after deployment
- Check if domain is generated in Settings
- Verify service is running (green status)

### Data Not Persisting
- Ensure volume is mounted at `/app/data`
- Check volume status in Settings → Volumes
- Restart service after adding volume

### Service Crashes
- Check logs in Railway dashboard
- Verify port 3001 is exposed
- Check environment variables

## Useful Commands

View logs:
```bash
railway logs
```

Restart service:
```bash
railway service restart
```

Check deployment status:
```bash
railway status
```

## Support

- Railway Docs: https://docs.railway.app
- Uptime Kuma Docs: https://github.com/louislam/uptime-kuma
- Railway Discord: https://discord.gg/railway
