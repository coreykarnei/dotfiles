# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Overview

Personal dotfiles repository for a macOS development environment built around Ghostty + tmux + Helix + Claude Code. The theme is Catppuccin Mocha throughout, with transparency enabled.

## Installation

```bash
./install.sh
```

This symlinks all config files into `~/.config/` (and `bin/ide` into `~/.local/bin/`). Existing files are backed up with `.bak` suffix. The script is idempotent.

## Structure

- `bin/ide` — Bash script that creates a tmux IDE layout: Helix (top-left 40%), terminal (bottom-left 40%), Claude Code (right 60%). Usage: `ide [path]`
- `ghostty/config` — Ghostty terminal config (JetBrains Mono, transparency, VSCode-like keybindings)
- `helix/config.toml` — Helix editor config (relative line numbers, LSP inlay hints, vi-like bindings)
- `helix/themes/` — Custom Catppuccin Mocha variant with transparent background
- `tmux/tmux.conf` — tmux config (Ctrl-a prefix, vi copy mode, Alt+arrow pane nav, Catppuccin status bar)
- `claude/` — Claude Code hooks fragment (manually merged into `~/.claude/settings.json`, NOT symlinked by `install.sh`). See `claude/README.md`.

## Key Conventions

- All configs symlink into `~/.config/<tool>/` via `install.sh` — add new tools by adding a `link` call there
- tmux prefix is `Ctrl-a` (not default `Ctrl-b`)
- Pane navigation: Alt+arrows (no prefix) or prefix + hjkl
- The `ide` script is the primary workflow entry point — it expects `hx` and `claude` to be on PATH
