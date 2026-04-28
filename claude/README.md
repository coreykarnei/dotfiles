# Claude Code hooks

Audible + visual "done" / "input needed" signals for Claude Code, designed to work with the Ghostty + tmux setup in this repo.

| Event | Sound | Bell propagates to |
|---|---|---|
| `Stop` (Claude finished) | `Blow.aiff` | tmux window status flag, Ghostty tab attention indicator |
| `Notification` (input needed) | `Tink.aiff` | same |

Differentiation lives in the **sound**. The visual surfaces (tmux status flag, Ghostty tab badge) just say "look here."

## Why this isn't auto-installed

Claude Code writes to `~/.claude/settings.json` itself when you toggle things in `/config`, accept dialogs, enable plugins, etc. Symlinking the file from this repo would cause constant `git status` noise and risk overwriting upstream changes.

So we keep `hooks.json` here as a reference fragment and merge it manually.

## Incorporating

Merge `hooks.json` into `~/.claude/settings.json`:

```bash
jq -s '.[0] * .[1]' ~/.claude/settings.json claude/hooks.json > /tmp/settings.json && mv /tmp/settings.json ~/.claude/settings.json
```

Or just copy the `hooks` block by hand.

Hooks load at session start — open a new `claude` session for the change to take effect.

## Companion settings

The hooks rely on terminal config that *is* checked in:

- `tmux/tmux.conf` — `bell-action any`, `monitor-bell on`, `window-status-bell-style` (red/bold flag in status bar)
- `ghostty/config` — `bell-features = attention,title,...` (tab attention indicator on bell)

If you tweak hook commands, sound choices live in `/System/Library/Sounds/` (Basso, Blow, Bottle, Frog, Funk, Glass, Hero, Morse, Ping, Pop, Purr, Sosumi, Submarine, Tink).
