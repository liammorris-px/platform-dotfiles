#!/bin/bash
# Install zsh as a prebuilt binary into ~/.local (no conda, no compile)

set -euo pipefail

PREFIX="${PREFIX:-$HOME/.local}"
export PATH="$PREFIX/bin:$PATH"

echo "🔧 Setting up zsh → $PREFIX..."

if command -v zsh >/dev/null 2>&1 && [[ "$(command -v zsh)" == "$PREFIX/bin/zsh" ]]; then
    echo "✅ Zsh already installed at $PREFIX/bin/zsh ($(zsh --version))"
    exit 0
fi

mkdir -p "$PREFIX"

# Prebuilt zsh binaries (romkatv/zsh-bin) — installs into PREFIX/bin
# -d: install root, -e no: don't edit shell rc files (we manage those ourselves)
curl -fsSL https://raw.githubusercontent.com/romkatv/zsh-bin/master/install \
    | sh -s -- -d "$PREFIX" -e no

hash -r 2>/dev/null || true

if ! command -v zsh >/dev/null 2>&1; then
    echo "❌ zsh not found after install. Expected: $PREFIX/bin/zsh"
    exit 1
fi

echo "✅ Zsh installed: $(zsh --version) ($PREFIX/bin/zsh)"
echo "   Start it with: exec zsh"
