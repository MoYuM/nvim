# 🐟 Moyu Neovim Config

## Introduction

Personal Neovim configuration, optimized for web development. Simple, clean, and fast.

- 😎 Default auto session and auto save, instantly return to the last working state
- 💫 Out-of-the-box web development environment, with support for tailwindcss
- 🎈 Strive for simplicity, no unnecessary UI components

![nvim](./images/nvim.png)

## Requirements

- Neovim
- make
- [ripgrep](https://github.com/BurntSushi/ripgrep)
- [lazygit](https://github.com/jesseduffield/lazygit)
- need node.js > 16.0.0 for copilot

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
| `<leader>o` | Recent files |
| `<leader>f` | Search files |
| `<leader>lg` | Global search |
| `=` | Format |
| `Ctrl + ;` | Accept copilot suggestions |


## Github Copilot
```
:Copilot auth
```
