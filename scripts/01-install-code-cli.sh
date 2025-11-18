#!/bin/bash
# Install VS Code tunnel (VS Code CLI)

set -e

echo "🔧 Installing VS Code CLI..."

# Check if already installed
if command -v code >/dev/null 2>&1; then
    echo "✅ VS Code CLI already installed"
    exit 0
fi

mkdir -p ~/.local/bin/
curl -sL 'https://code.visualstudio.com/sha/download?build=stable&os=cli-alpine-x64' | tar -xz -C ~/.local/bin/

echo "✅ VS Code CLI installed"







