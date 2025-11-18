# Platform Dotfiles

A collection of dotfiles and setup scripts for the Jupyter platform environment (jovyan user).

## Quick Setup

1. Clone this repository:
   ```bash
   git clone <repository-url> ~/platform-dotfiles
   ```

2. Run the main installer:
   ```bash
   bash ~/platform-dotfiles/install.sh
   ```
   
   *Note: The installer can be run from anywhere - it will automatically find its location*

## What Gets Installed

- VS Code Tunnel (with GitHub authentication)
- Zsh shell (compiled from source)
- Starship prompt (with conda environment support)
- Zsh plugins (autosuggestions, syntax highlighting)
- VS Code extensions

## Manual Installation

If you prefer to run individual installers:

```bash
bash scripts/00-setup-directories.sh
bash scripts/01-install-code-tunnel.sh
bash scripts/02-install-zsh.sh
bash scripts/03-install-starship.sh
bash scripts/04-install-zsh-plugins.sh
bash scripts/05-install-vscode-extensions.sh
```

## Configuration

- VS Code extensions are listed in `config/vscode-extensions.txt`
- Starship configuration is in `config/starship.toml` (includes conda env support)
- Base Zsh configuration is in `config/.zshrc`

## Requirements

- Linux environment (assumes /home/jovyan)
- Git
- Build tools (gcc, make) for zsh compilation
- curl or wget for downloads
- Internet connection
