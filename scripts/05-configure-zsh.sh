#!/bin/bash
# Install zsh plugins: autosuggestions and syntax highlighting
set -e

SCRIPT_PATH="$(cd "$(dirname "$(realpath "${BASH_SOURCE[0]}")")" && pwd)"
REPO_DIR="$(cd "$SCRIPT_PATH/.." && pwd)"
ZSH_DIR="$HOME/.zsh"

echo "🔧 Installing zsh plugins..."

# Install fzf (fuzzy finder)
echo "🔧 Installing fzf..."
if command -v brew >/dev/null 2>&1; then
    if ! brew list fzf >/dev/null 2>&1; then
        brew install fzf
    else
        echo "fzf already installed via Homebrew."
    fi
else
    if [ -d "$HOME/.fzf" ]; then
        cd "$HOME/.fzf" && git pull -q
    else
        git clone -q --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
        ~/.fzf/install --all --no-bash --no-fish
    fi
fi
mkdir -p "$ZSH_DIR"

# Install zsh-autosuggestions
if [ -d "$ZSH_DIR/zsh-autosuggestions" ]; then
    cd "$ZSH_DIR/zsh-autosuggestions" && git pull -q
else
    git clone -q https://github.com/zsh-users/zsh-autosuggestions.git "$ZSH_DIR/zsh-autosuggestions"
fi

# Install zsh-syntax-highlighting
if [ -d "$ZSH_DIR/zsh-syntax-highlighting" ]; then
    cd "$ZSH_DIR/zsh-syntax-highlighting" && git pull -q
else
    git clone -q https://github.com/zsh-users/zsh-syntax-highlighting.git "$ZSH_DIR/zsh-syntax-highlighting"
fi

# copy .zshrc if it doesn't exist
if [ -f ~/.zshrc ]; then
    echo "⚠️ Existing .zshrc found, not overwriting"
else
    cp "$REPO_DIR/config/.zshrc" ~/.zshrc
fi

echo "✅ Zsh configured"
