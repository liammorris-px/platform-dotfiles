#!/bin/bash
# Install VS Code extensions from configuration file

set -e

SCRIPT_DIR="$(dirname "$(dirname "$(realpath "$0")")")"
CONFIG_FILE="$SCRIPT_DIR/config/vscode-extensions.txt"

echo "🔧 Installing VS Code extensions..."

# Read and install extensions
while IFS= read -r line; do
    # Skip empty lines and comments
    if [[ -n "$line" && ! "$line" =~ ^[[:space:]]*# ]]; then
        code --install-extension "$line" >/dev/null 2>&1 || echo "❌ Failed: $line"
    fi
done < "$CONFIG_FILE"

echo "✅ VS Code extensions installed"
