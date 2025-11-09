#!/usr/bin/env bash
# Uso: ./setup_and_push.sh https://github.com/SEU_USERNAME/pemautomation-website.git
set -e
if [ -z "$1" ]; then
  echo "Uso: ./setup_and_push.sh https://github.com/SEU_USERNAME/pemautomation-website.git"
  exit 1
fi
REMOTE="$1"
pnpm install
pnpm run build
touch dist/.nojekyll
echo "www.pemautomation.pt" > dist/CNAME
if [ ! -d .git ]; then
  git init
fi
git add .
git commit -m "chore: add GH Pages deploy workflow and vite config" || true
git remote remove origin 2>/dev/null || true
git remote add origin "$REMOTE"
git branch -M main
git push -u origin main
echo "Push feito. Verifique Actions -> 'Deploy to GitHub Pages' no GitHub."