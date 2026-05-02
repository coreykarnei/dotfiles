#!/usr/bin/env bash
# install.sh — Symlink dotfiles into place
set -euo pipefail

DOTFILES="$(cd "$(dirname "$0")" && pwd)"
OS="$(uname -s)"

link() {
    local src="$1" dst="$2"
    mkdir -p "$(dirname "$dst")"
    if [ -e "$dst" ] && [ ! -L "$dst" ]; then
        echo "  backup: $dst → ${dst}.bak"
        mv "$dst" "${dst}.bak"
    fi
    ln -sfn "$src" "$dst"
    echo "  linked: $dst → $src"
}

echo "Installing dotfiles from $DOTFILES (OS: $OS)"

# ─── Cross-platform ────────────────────────────────────────
link "$DOTFILES/helix/config.toml"                       "$HOME/.config/helix/config.toml"
link "$DOTFILES/helix/themes/catppuccin_mocha_transparent.toml" "$HOME/.config/helix/themes/catppuccin_mocha_transparent.toml"
link "$DOTFILES/tmux/tmux.conf"                          "$HOME/.config/tmux/tmux.conf"
link "$DOTFILES/bin/ide"                                 "$HOME/.local/bin/ide"

# ─── macOS only ────────────────────────────────────────────
if [ "$OS" = "Darwin" ]; then
    link "$DOTFILES/ghostty/config"                      "$HOME/.config/ghostty/config"
    link "$DOTFILES/bin/ide-pi"                          "$HOME/.local/bin/ide-pi"
fi

echo "Done."
