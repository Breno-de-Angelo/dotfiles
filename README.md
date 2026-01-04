# Custom Sway Dotfiles (Ubuntu 24.04)

This repository contains my personal configuration files (dotfiles) for a generic **Ubuntu 24.04** installation.

It uses **GNU Stow** to manage symlinks, keeping the home directory clean and the configurations centralized.

## 🖼️ Environment Summary

*   **OS:** Ubuntu 24.04 LTS
*   **Window Manager:** [Sway](https://swaywm.org/) (Wayland)
*   **Terminal:** [Alacritty](https://alacritty.org/)
*   **Shell:** Bash + [Starship](https://starship.rs/) prompt
*   **Launcher / Menu:** [Wofi](https://hg.sr.ht/~scoopta/wofi)
*   **Bar:** [Waybar](https://github.com/Alexays/Waybar)
*   **File Listing:** `eza` (modern `ls` replacement)
*   **Fuzzy Finder:** `fzf`
*   **Screenshots/Recording:** `grim`, `slurp`, `wf-recorder` + Custom Scripts

## 🚀 Installation on a New Machine

Follow these steps to replicate this environment on a fresh Ubuntu installation.

### 1. Install Dependencies

First, update the system and install the core packages:

```bash
sudo apt update && sudo apt upgrade -y
sudo apt install -y \
    sway swaybg swaylock swayidle waybar wofi \
    alacritty \
    git stow curl build-essential \
    grim slurp wf-recorder jq \
    fzf bat
```

### 2. Install Rust tools & Starship

Some tools are better installed via other methods:

```bash
# Install Rust (if not installed)
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
source $HOME/.cargo/env

# Install eza (ls replacement)
cargo install eza

# Install Starship (prompt)
curl -sS https://starship.rs/install.sh | sh
```

### 3. Install Fonts (Crucial)

The configuration expects **CaskaydiaCove Nerd Font**. Without this, icons will be broken.

```bash
mkdir -p ~/.local/share/fonts
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.1.1/CascadiaCode.zip
unzip -o CascadiaCode.zip -d ~/.local/share/fonts/
rm CascadiaCode.zip
fc-cache -f -v
```

### 4. Clone & Stow

Clone this repository to your home folder:

```bash
cd ~
git clone <YOUR_REPO_URL> dotfiles
cd dotfiles
```

Apply the configurations using Stow:

```bash
# This creates symlinks from ~/dotfiles/* to ~/
stow bash
stow sway
stow alacritty
stow starship
stow scripts
stow core
```

### 5. Setup Secrets

Create a `.bash_secrets` file in your home directory for sensitive keys (like OpenAI API Key). This file is ignored by Git.

```bash
echo 'export OPENAI_API_KEY="your-key-here"' > ~/.bash_secrets
source ~/.bashrc
```

## ⌨️ Keybindings Cheatsheet

| Key Combo | Action |
| :--- | :--- |
| **Win + Enter** | Open Alacritty Terminal |
| **Win + D** | Open App Launcher (Wofi) |
| **Win + K** | **Show Keybindings Help** (Searchable list) |
| **Win + Shift + C** | Reload Sway Config |
| **Win + Shift + E** | Exit Sway |
| **Win + Drag (Left)** | Move Window |
| **Win + Drag (Right)** | Resize Window |

### 📸 Capture & Recording

| Key Combo | Action |
| :--- | :--- |
| **PrintScreen** | Screenshot (Fullscreen) |
| **Shift + Print** | Screenshot (Select Region) |
| **Ctrl + Print** | Screenshot (Active Window) |
| **Alt + Shift + V** | **Recording Menu** (Video/Audio options) |
| **Alt + Shift + R** | Record Fullscreen (No Audio) |
| **Alt + Shift + S** | Record Region (No Audio) |

## 📂 Structure

*   `sway/`: Window manager config.
*   `alacritty/`: Terminal config (font, theme).
*   `bash/`: `.bashrc` and shell settings.
*   `starship/`: Prompt visual configuration.
*   `scripts/`: Custom helper scripts (screenshot, recording, etc) linked to `~/.local/bin`.
*   `core/`: Base themes and system assets (formerly external dependencies).
