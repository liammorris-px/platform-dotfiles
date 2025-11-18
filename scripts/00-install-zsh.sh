#!/bin/bash
# Install/setup zsh

set -e

echo "🔧 Setting up zsh..."

if command -v zsh >/dev/null 2>&1; then
    echo "✅ Zsh is already available!"
    exit 0
fi


conda install -y zsh 2>/dev/null || echo "❌ Could not install zsh automatically."
echo "✅ Zsh installed"