# Platform Dotfiles

A collection of dotfiles and setup scripts for the Jupyter platform environment (jovyan user).

Installs tools into `~/.local` (no conda, no root). Zsh uses a prebuilt binary; Node.js uses the official binary tarball.

## Quick Setup

1. Clone this repository:
   ```bash
   git clone <repository-url> ~/platform-dotfiles
   ```

2. Run the main installer:
   ```bash
   bash ~/platform-dotfiles/install.sh
   ```

   *Note: The installer can be run from anywhere — it finds its own location.*

3. Start zsh (new shell or):
   ```bash
   export PATH="$HOME/.local/bin:$PATH"
   exec zsh
   ```

## What Gets Installed

- Zsh (prebuilt binary into `~/.local`)
- VS Code CLI / tunnel
- Starship prompt
- Zsh plugins (autosuggestions, syntax highlighting, fzf)
- VS Code extensions
- Node.js + npm (official tarball → `~/.local`)
- Claude Code (`npm install -g @anthropic-ai/claude-code`)

## Manual Installation

```bash
bash scripts/00-install-zsh.sh
bash scripts/01-install-code-cli.sh
bash scripts/02-install-starship.sh
bash scripts/03-install-code-extensions.sh
bash scripts/04-configure-bash.sh
bash scripts/05-configure-zsh.sh
bash scripts/06-install-nodejs.sh
bash scripts/07-install-claude-code.sh
```

## Configuration

- VS Code extensions: `config/vscode-extensions.txt`
- Starship: `config/starship.toml`
- Base Zsh config: `config/.zshrc` (adds `~/.local/bin` to `PATH`)

## Requirements

- Linux x86_64 (assumes `/home/jovyan`)
- Git, curl
- Internet connection

## Overrides

```bash
PREFIX=$HOME/.local bash scripts/00-install-zsh.sh
NODE_VERSION=v22.17.1 bash scripts/06-install-nodejs.sh
```
