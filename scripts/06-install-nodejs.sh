#!/bin/bash
# Install Node.js + npm into ~/.local (official binary tarball, no conda)

set -euo pipefail

PREFIX="${PREFIX:-$HOME/.local}"
# Pin to current Node.js LTS; override with NODE_VERSION=vX.Y.Z
NODE_VERSION="${NODE_VERSION:-v22.17.1}"
ARCH="${ARCH:-linux-x64}"

export PATH="$PREFIX/bin:$PATH"

echo "🔧 Installing Node.js ${NODE_VERSION} (+ npm) → $PREFIX..."

if command -v node >/dev/null 2>&1 && command -v npm >/dev/null 2>&1; then
    if [[ "$(command -v node)" == "$PREFIX/bin/node" ]]; then
        echo "✅ Node.js already installed: $(node --version) / npm $(npm --version)"
        exit 0
    fi
fi

mkdir -p "$PREFIX"
TMP_DIR="$(mktemp -d)"
trap 'rm -rf "$TMP_DIR"' EXIT

TARBALL="node-${NODE_VERSION}-${ARCH}.tar.xz"
URL="https://nodejs.org/dist/${NODE_VERSION}/${TARBALL}"

echo "📦 Downloading ${URL}..."
curl -fsSL "$URL" -o "$TMP_DIR/$TARBALL"
tar -xJf "$TMP_DIR/$TARBALL" -C "$TMP_DIR"

# Official tarball layout: bin/, lib/, include/, share/ — merge into ~/.local
cp -a "$TMP_DIR/node-${NODE_VERSION}-${ARCH}/." "$PREFIX/"

hash -r 2>/dev/null || true

if ! command -v node >/dev/null 2>&1 || ! command -v npm >/dev/null 2>&1; then
    echo "❌ Node/npm not found after install. Ensure $PREFIX/bin is on PATH."
    exit 1
fi

# Keep global npm packages under the user prefix
npm config set prefix "$PREFIX"

echo "✅ Node.js $(node --version) / npm $(npm --version)"
echo "   Binaries: $PREFIX/bin/node , $PREFIX/bin/npm"
