# Dotfiles

Neovim configuration for macOS and Linux. Requires Neovim 0.11 or newer.

## Screenshots

![Neovim dashboard](https://user-images.githubusercontent.com/45604642/227270155-cd76ecb2-c4c6-4461-b5f9-21fbb0e8cfff.png)
![Neovim editor](https://user-images.githubusercontent.com/45604642/227272448-3f558d12-5917-4fa9-ab7b-b19548757b3b.png)

## macOS

```sh
xcode-select --install
brew install neovim git ripgrep fd
```

## Linux Mint / Ubuntu

Install Neovim 0.11 or newer, then:

```sh
sudo apt install git ripgrep fd-find xclip build-essential
mkdir -p "$HOME/.local/bin"
ln -s "$(command -v fdfind)" "$HOME/.local/bin/fd"
```

Make sure `~/.local/bin` is on your `PATH`. On Wayland, use `wl-clipboard` instead of `xclip`.

## Link and start

```sh
git clone https://github.com/viktorholk/dotfiles.git "$HOME/.dotfiles"
mkdir -p "$HOME/.config"
ln -s "$HOME/.dotfiles/nvim" "$HOME/.config/nvim"
nvim
```

If `~/.config/nvim` already exists, move it aside before creating the link. If you clone elsewhere, use that path in the link. Plugins install on first launch; use `:Mason` to install language servers and formatters for the languages you use. A Nerd Font enables the UI icons.

## Using the config

- Telescope finds files with `fd` and searches text with `ripgrep`. File search includes hidden files and `.env` files.
- LSP, completion, snippets, Tree-sitter, Git signs, Harpoon, and a terminal are configured. Install language tools as needed with `:Mason`; web language servers also need Node, and Roslyn needs the .NET SDK.
- Conform uses Biome for JavaScript, TypeScript, and JSON, RuboCop for Ruby, and an attached LSP formatter for other files. Use `:ConformInfo` to check formatting.
- Run `:checkhealth` if something is not working. Plugin versions are recorded in `nvim/lazy-lock.json`; use `:Lazy restore` to return to them.

## Keymaps

`Space` is the leader key. Press it and pause to see the available groups in which-key.

### Navigation and files

| Key | Action |
| --- | --- |
| `Shift-h` / `Shift-l` | Previous / next buffer |
| `Ctrl-h/j/k/l` | Move between windows |
| `Space e` / `Space E` | Toggle explorer / reveal current file |
| `Space ff` / `Space fs` | Find files / search text |
| `Space fb` / `Space h` | List buffers / search help |
| `Space w` / `Space q` | Save / quit |
| `Space or` | Toggle relative line numbers |

### Code and tools

| Key | Action |
| --- | --- |
| `Space lg/lh/lr/lc` | Definition / hover / references / code action (with LSP) |
| `Space ld` / `Space lf` | Diagnostics / format |
| `Ctrl-Space` | Completion in insert mode; Tree-sitter selection in normal or visual mode |
| `Tab` / `Shift-Tab` | Next / previous completion or snippet stop |
| `Space gn/gp` | Next / previous Git hunk |
| `Space gs/gu` | Stage / undo staged hunk |
| `Space za/zm` | Add file to Harpoon / open Harpoon menu |
| `Space z1`–`Space z4` | Open a Harpoon file |
| `Ctrl-t` | Toggle terminal |
| `Space tf/th/tv` | Floating / horizontal / vertical terminal |
