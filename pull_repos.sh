#!/bin/bash

# ==============================
# Add your repositories below
# ==============================

REPOS=(
  "git@github.com:rfarrelly/collector.git"
  # Add more repos here
)

# ==============================
# Clone into the script's folder
# ==============================

# Get the directory where this script is located
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_DIR="$SCRIPT_DIR/repos"
mkdir -p "$REPO_DIR"
cd "$REPO_DIR" || exit 1

echo "Using directory: $SCRIPT_DIR"
echo

for REPO in "${REPOS[@]}"; do
  NAME=$(basename -s .git "$REPO")

  if [ -d "$NAME/.git" ]; then
    echo "🔄 Pulling $NAME..."
    git -C "$NAME" pull --ff-only
  else
    echo "⬇️  Cloning $NAME..."
    git clone "$REPO"
  fi
done

echo
echo "✅ All repositories processed."
