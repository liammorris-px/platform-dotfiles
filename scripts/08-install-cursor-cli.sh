#!/bin/bash
# Install Cursor CLI

set -euo pipefail

export PATH="$HOME/.local/bin:$PATH"

echo "🔧 Installing Cursor CLI..."

curl -fsS https://cursor.com/install | bash

echo "✅ Cursor CLI installed"
