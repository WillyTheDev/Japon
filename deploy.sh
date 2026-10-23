#!/usr/bin/env bash
set -euo pipefail
# Publie cette page to-do sur GitHub Pages (repo public requis pour l'option gratuite).
# Usage : ./deploy.sh <ton-pseudo-github>
GH_USER="${1:?usage: ./deploy.sh <github-username>}"
cd "$(dirname "$0")"

command -v gh >/dev/null 2>&1 || { echo "Installe gh d'abord : https://cli.github.com"; exit 1; }
gh auth status >/dev/null 2>&1 || gh auth login

gh repo create "$GH_USER/japon-todo" --public --source=. --push

cat <<EOF
✅ Repo pushé. Dernière étape (1 clic) — active GitHub Pages :
   https://github.com/$GH_USER/japon-todo/settings/pages
   Source -> "Deploy from a branch" -> branche "main" -> dossier "/ (root)" -> Save

Ton URL (dispo ~1 min après) :
   https://$GH_USER.github.io/japon-todo/
EOF