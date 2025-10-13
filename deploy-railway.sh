#!/bin/bash

# Uptime Kuma Railway - Deployment Script
# This script helps configure Railway deployment

echo "======================================"
echo "Uptime Kuma Railway - Deployment"
echo "======================================"
echo ""

echo "Manual Deployment Steps:"
echo "------------------------"
echo ""
echo "1. CREATE RAILWAY PROJECT"
echo "   Go to: https://railway.app/dashboard"
echo "   Click: 'New Project' → 'Deploy from GitHub repo'"
echo "   Select: Your uptime-kuma-railway repository"
echo ""
echo "2. WAIT FOR BUILD"
echo "   Railway will automatically detect the Dockerfile"
echo "   Build time: ~3-5 minutes"
echo "   Watch the logs in the Railway dashboard"
echo ""
echo "3. ADD PERSISTENT VOLUME (IMPORTANT!)"
echo "   In Railway dashboard:"
echo "   - Click on your service"
echo "   - Go to 'Settings' tab"
echo "   - Scroll to 'Volumes' section"
echo "   - Click 'New Volume'"
echo "   - Mount Path: /app/data"
echo "   - Click 'Add'"
echo ""
echo "4. SET ENVIRONMENT VARIABLES (Optional)"
echo "   In Railway dashboard:"
echo "   - Click on your service"
echo "   - Go to 'Variables' tab"
echo "   - Add: TZ = UTC"
echo "   - Add: UMASK = 0022"
echo ""
echo "5. GENERATE PUBLIC DOMAIN"
echo "   In Railway dashboard:"
echo "   - Click on your service"
echo "   - Go to 'Settings' tab"
echo "   - Scroll to 'Networking'"
echo "   - Click 'Generate Domain'"
echo ""
echo "6. ACCESS UPTIME KUMA"
echo "   Open the Railway-generated URL"
echo "   Example: https://uptime-kuma-production-xxxx.up.railway.app"
echo ""
echo "======================================"
echo ""

# Check if railway CLI is available
if command -v railway &> /dev/null; then
    echo "Railway CLI detected!"
    echo ""
    read -p "Do you want to deploy via CLI? (yes/no): " use_cli

    if [ "$use_cli" == "yes" ]; then
        echo ""
        echo "Deploying via Railway CLI..."
        echo ""

        # Check if we're in a railway project
        if railway status &> /dev/null; then
            echo "✓ Already linked to Railway project"
        else
            echo "Linking to Railway project..."
            railway link
        fi

        echo ""
        echo "Deploying..."
        railway up

        echo ""
        echo "Setting environment variables..."
        railway variables set TZ=UTC
        railway variables set UMASK=0022

        echo ""
        echo "✓ Deployment complete!"
        echo ""
        echo "View logs: railway logs"
        echo "Check status: railway status"
        echo ""
    fi
else
    echo "Note: Railway CLI not found. Using manual steps above."
    echo ""
    echo "To install Railway CLI:"
    echo "  npm install -g @railway/cli"
    echo ""
fi

echo "For detailed instructions, see: DEPLOYMENT_GUIDE.md"
echo ""
