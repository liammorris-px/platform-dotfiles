#!/bin/bash
# Install starship prompt

set -e

echo "🔧 Installing starship..."

# Check if already installed
if command -v starship >/dev/null 2>&1; then
    echo "✅ Starship already installed"
else
    mkdir -p ~/.local/bin/
    curl -sL https://github.com/starship/starship/releases/latest/download/starship-x86_64-unknown-linux-musl.tar.gz | tar -xz -C ~/.local/bin/
fi

# Copy starship config
SCRIPT_PATH="$(realpath "${BASH_SOURCE[0]}")"
SCRIPT_DIR="$(dirname "$SCRIPT_PATH")"
REPO_DIR="$(dirname "$SCRIPT_DIR")"

mkdir -p ~/.config/

# Check if starship config already exists
if [ -f ~/.config/starship.toml ]; then
    echo "⚠️ Existing starship.toml found, not overwriting"
else
    cp "$REPO_DIR/config/starship.toml" ~/.config/starship.toml
fi

echo "✅ Starship installed successfully"