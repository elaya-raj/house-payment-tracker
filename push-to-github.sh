#!/bin/bash
# Run this script to push the House Payment Tracker to your GitHub repo
# Usage: ./push-to-github.sh

set -e
cd "$(dirname "$0")"

REPO_NAME="house-payment-tracker"  # Change if you used a different repo name
GITHUB_USER="elaya-raj"

echo "=== House Payment Tracker - Push to GitHub ==="
echo ""
echo "Make sure you've created the repo at: https://github.com/$GITHUB_USER/$REPO_NAME"
echo "(Create it empty - no README, no .gitignore)"
echo ""
read -p "Press Enter to continue..."

if [ ! -d .git ]; then
  git init
  git branch -M main
fi

git add .
git status
echo ""
read -p "Commit and push? (y/n) " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]; then
  git add .
  git commit -m "House Payment Tracker - initial deploy" || true
  git remote remove origin 2>/dev/null || true
  git remote add origin "https://github.com/$GITHUB_USER/$REPO_NAME.git"
  git push -u origin main
  echo ""
  echo "Done! Enable GitHub Pages:"
  echo "  https://github.com/$GITHUB_USER/$REPO_NAME/settings/pages"
  echo "  Source: Deploy from branch, main, / (root)"
  echo ""
  echo "Your app will be at: https://$GITHUB_USER.github.io/$REPO_NAME/"
fi
