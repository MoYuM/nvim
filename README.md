# 🐟 Moyu Neovim Config

<a href="https://dotfyle.com/MoYuM/nvim"><img src="https://dotfyle.com/MoYuM/nvim/badges/plugins?style=flat-square" /></a>
<a href="https://dotfyle.com/MoYuM/nvim"><img src="https://dotfyle.com/MoYuM/nvim/badges/leaderkey?style=flat-square" /></a>
<a href="https://dotfyle.com/MoYuM/nvim"><img src="https://dotfyle.com/MoYuM/nvim/badges/plugin-manager?style=flat-square" /></a>

## Introduction

Personal Neovim configuration, optimized for web development. Simple, clean, and fast.

> "Moyu" represents the Chinese term "摸鱼"

- 😎 Default auto session and auto save, instantly return to the last working state
- 💫 Out-of-the-box web development environment, with support for tailwindcss
- 🎈 Strive for simplicity, no unnecessary UI components

## Simplicity UI

Moyu simplifies the UI as much as possible, while retaining the necessary information.
- The file navigator is hidden by default.
- Use `fidget.nvim` to display diagnostics at the top right.
- Git commit information is displayed in the status line, not behind the cursor.
- And much more...

![nvim](./images/nvim.png)

## Requirements

- Neovim
- make
- need node.js > 16.0.0 for copilot
- [ripgrep](https://github.com/BurntSushi/ripgrep) for fuzzy search
- [lazygit](https://github.com/jesseduffield/lazygit) for lazygit.nvim

## Install

```
git clone https://github.com/MoYuM/nvim ~/.config/nvim --depth 1 && nvim
```

## UnInstall

```
rm -rf ~/.config/nvim
rm -rf ~/.local/share/nvim
```

## Suggested

- JetBrainsMono Nerd Font
- iTerm2

## Mapping

Some custom key mappings you need to pay attention to

| Key | Mapping |
|------|------|
| `Space` | `<leader>` |
| `1` | File navigation |
| `=` | Format |
| `Ctrl + ;` | Accept copilot suggestions |
| `3` | find next word under cursor |
| `\\` | resume telescope |
| `<esc>` | no highlight |
| `=` | format |
| `<leader>a` | Select all |
| `<leader><leader>` | Find Commands |
| `<leader>t` | toggle terminal float |
| `<leader>ca` | code action |
| `<leader>rn` | rename |
| `<leader>rl` | Restart lsp server |
| `<leader>g` | lazygit |
| `<leader>f` | Find Files |
| `<leader>lg` | Live Grep |
| `<leader>o` | Recent files |
| `<C-j>` | move line down |
| `<C-k>` | move line up |
| `<C-h>` | move char left |
| `<C-l>` | move char right |
| `<C-j>` (in visual mode) | move block down |
| `<C-k>` (in visual mode) | move block up |
| `<C-h>` (in visual mode) | move block left |
| `<C-l>` (in visual mode) | move block right |
| `<esc><esc>` (in terminal mode) | quit term mode |

## Github Copilot
```
:Copilot auth
```
