# Dotfiles

Personal dotfiles managed with [Dotbot](https://github.com/anishathalye/dotbot).

## Installation

```bash
git clone --recursive https://github.com/spezifanta/dotfiles.git ~/.dotfiles
cd ~/.dotfiles
./install
```

Or if you already cloned without `--recursive`:

```bash
cd ~/.dotfiles
./install  # This will automatically init the dotbot submodule
```

## What's Included

| Component | Description |
|-----------|-------------|
| **zsh** | Shell config with custom prompt, aliases, and functions |
| **aliases** | Shortcuts for git, ls, grep, and common commands |
| **functions** | `cd` with auto-ls, `mkd`, `psgrep`, `whatsmyip`, `gcm` |
| **git** | Extensive aliases (`st`, `co`, `hist`, `wip`, `cleanup`), auto-rebase, rerere |
| **gitignore** | Global ignores for swap files, .pyc, .DS_Store |
| **alacritty** | Terminal config with Hack font, custom color scheme, transparency |

## Local Overrides

Git supports local config via `~/.gitconfig.local` (created on first install, gitignored). Use this for machine-specific settings like your email.

## Updating

```bash
cd ~/.dotfiles
git pull
./install
```

## Credits

- [dirkd/dotfiles](https://github.com/dirkd/dotfiles)
- [zezhyrule/dotfiles](https://github.com/zezhyrule/dotfiles)
- [mathiasbynens/dotfiles](https://github.com/mathiasbynens/dotfiles)
- [paulirish/dotfiles](https://github.com/paulirish/dotfiles)
- [kajmaj87/dotbot-dotfiles](https://github.com/kajmaj87/dotbot-dotfiles)
