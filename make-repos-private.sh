#!/bin/bash

# Script to make all spacexp-ai repositories private
# Prerequisites: GitHub CLI (gh) must be installed and authenticated

set -e

# Array of repositories to make private
REPOS=(
  "spacexp-ai/Saas"
  "spacexp-ai/space-xp"
  "spacexp-ai/top-tracker"
  "spacexp-ai/top-tracker-981a106f"
  "spacexp-ai/top-trackers-webapp"
)

echo "🔒 Starting process to make repositories private..."
echo ""

# Counter for tracking progress
total=${#REPOS[@]}
current=0

for repo in "${REPOS[@]}"; do
  ((current++))
  echo "[$current/$total] Making $repo private..."
  
  if gh repo edit "$repo" --private; then
    echo "✅ $repo is now private"
  else
    echo "❌ Failed to make $repo private"
    exit 1
  fi
  echo ""
done

echo "🎉 All repositories are now private!"
