#!/bin/bash
# Install Claude Code CLI via npm into the user prefix (~/.local)

set -euo pipefail

PREFIX="${PREFIX:-$HOME/.local}"
export PATH="$PREFIX/bin:$PATH"

echo "🔧 Installing Claude Code..."

if ! command -v npm >/dev/null 2>&1; then
    echo "❌ npm not found. Run scripts/06-install-nodejs.sh first."
    exit 1
fi

# Ensure globals land in ~/.local/bin
npm config set prefix "$PREFIX"

if command -v claude >/dev/null 2>&1; then
    echo "ℹ️  Claude Code already present ($(claude --version 2>/dev/null || echo installed)); upgrading..."
fi

npm install -g @anthropic-ai/claude-code

if ! command -v claude >/dev/null 2>&1; then
    echo "❌ claude binary not on PATH after install"
    echo "   Expected under: $PREFIX/bin/claude"
    echo "   Ensure $PREFIX/bin is in your PATH (see config/.zshrc)"
    exit 1
fi

echo "✅ Claude Code installed: $(claude --version 2>/dev/null || echo ok)"
echo "   Run: claude"
