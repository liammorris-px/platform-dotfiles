#!/bin/bash
# Configure bash with aliases

set -e

SCRIPT_DIR="$(dirname "$(dirname "$(realpath "$0")")")"
echo "🔧 Configuring bash..."

# Copy bash aliases file
cp "$SCRIPT_DIR/config/.bash_aliases" ~/.bash_aliases

# Add sourcing to .bashrc if not already there
if ! grep -q "source ~/.bash_aliases" ~/.bashrc; then
    echo '[ -f ~/.bash_aliases ] && source ~/.bash_aliases' >> ~/.bashrc
fi

echo "✅ Bash configured"