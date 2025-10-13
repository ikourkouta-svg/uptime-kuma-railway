#!/bin/bash

# Uptime Kuma Railway - GitHub Setup Script
# This script helps you push your code to GitHub

echo "======================================"
echo "Uptime Kuma Railway - GitHub Setup"
echo "======================================"
echo ""

# Check if we're in the right directory
if [ ! -f "Dockerfile" ]; then
    echo "Error: Please run this script from the uptime-kuma-railway directory"
    exit 1
fi

echo "Step 1: Create GitHub Repository"
echo "--------------------------------"
echo "Please create a new repository on GitHub:"
echo "1. Go to: https://github.com/new"
echo "2. Repository name: uptime-kuma-railway"
echo "3. Description: Uptime Kuma monitoring tool on Railway"
echo "4. Choose Public or Private"
echo "5. DO NOT initialize with README"
echo "6. Click 'Create repository'"
echo ""
read -p "Have you created the repository? (yes/no): " created

if [ "$created" != "yes" ]; then
    echo "Please create the repository first, then run this script again."
    exit 0
fi

echo ""
echo "Step 2: Enter Your GitHub Username"
echo "-----------------------------------"
read -p "Enter your GitHub username: " github_user

if [ -z "$github_user" ]; then
    echo "Error: GitHub username cannot be empty"
    exit 1
fi

echo ""
echo "Step 3: Pushing to GitHub"
echo "-------------------------"

# Check if origin already exists
if git remote get-url origin 2>/dev/null; then
    echo "Removing existing origin..."
    git remote remove origin
fi

# Add GitHub remote
echo "Adding GitHub remote..."
git remote add origin "https://github.com/${github_user}/uptime-kuma-railway.git"

# Rename branch to main
echo "Renaming branch to main..."
git branch -M main

# Push to GitHub
echo "Pushing to GitHub..."
if git push -u origin main; then
    echo ""
    echo "✓ Successfully pushed to GitHub!"
    echo ""
    echo "Repository URL: https://github.com/${github_user}/uptime-kuma-railway"
    echo ""
else
    echo ""
    echo "✗ Failed to push to GitHub"
    echo ""
    echo "You may need to authenticate. Try one of these:"
    echo "1. Use GitHub Personal Access Token"
    echo "2. Set up SSH keys"
    echo "3. Use GitHub CLI (gh)"
    echo ""
    echo "Manual commands to try:"
    echo "  git remote add origin https://github.com/${github_user}/uptime-kuma-railway.git"
    echo "  git push -u origin main"
    exit 1
fi

echo "======================================"
echo "Next Steps: Deploy to Railway"
echo "======================================"
echo ""
echo "1. Go to: https://railway.app/dashboard"
echo "2. Click 'New Project'"
echo "3. Select 'Deploy from GitHub repo'"
echo "4. Choose: ${github_user}/uptime-kuma-railway"
echo "5. Wait for deployment to complete"
echo ""
echo "Full guide: See DEPLOYMENT_GUIDE.md"
echo ""
