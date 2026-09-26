# Dotfiles

Neovim configuration for macOS and Linux. Requires Neovim 0.12 or newer.

## Screenshots

![Neovim dashboard](https://user-images.githubusercontent.com/45604642/227270155-cd76ecb2-c4c6-4461-b5f9-21fbb0e8cfff.png)
![Neovim editor](https://user-images.githubusercontent.com/45604642/227272448-3f558d12-5917-4fa9-ab7b-b19548757b3b.png)

## macOS

```sh
xcode-select --install
brew install neovim git ripgrep fd tree-sitter-cli
```

## Linux Mint / Ubuntu

Install Neovim 0.12 or newer, then:

```sh
sudo apt install git ripgrep fd-find xclip build-essential
mkdir -p "$HOME/.local/bin"
ln -s "$(command -v fdfind)" "$HOME/.local/bin/fd"
```

Make sure `~/.local/bin` is on your `PATH`. On Wayland, use `wl-clipboard` instead of `xclip`.

Tree-sitter parser installation also requires the `tree-sitter` CLI version 0.26.1 or newer. Check with `tree-sitter --version`; the version in Ubuntu or Mint repositories may be too old. If needed, install a current CLI from the [official releases](https://github.com/tree-sitter/tree-sitter/releases) into a directory on your `PATH`. Avoid the npm package for this setup.

## Link and start

```sh
git clone https://github.com/viktorholk/dotfiles.git "$HOME/.dotfiles"
mkdir -p "$HOME/.config/ghostty"
ln -s "$HOME/.dotfiles/nvim" "$HOME/.config/nvim"
ln -s "$HOME/.dotfiles/ghostty/config.ghostty" "$HOME/.config/ghostty/config.ghostty"
nvim
```

If either link destination already exists, move it aside before creating the link. If you clone elsewhere, use that path in the links. On macOS, Ghostty also reads `~/Library/Application Support/com.mitchellh.ghostty/config.ghostty` after the XDG config; move that file aside if it overrides this config. Plugins install on first launch; use `:Mason` to install language servers and formatters for the languages you use.

## Ghostty font

The repo includes the regular **JetBrainsMono Nerd Font Mono** in `iterm/JetBrains Mono Regular Nerd Font Complete Mono.ttf`. Install it for your user before starting Ghostty. The linked Ghostty config selects this font at size 12; it also enables Neovim's Nerd Font icons.

On macOS:

```sh
mkdir -p "$HOME/Library/Fonts"
cp "$HOME/.dotfiles/iterm/JetBrains Mono Regular Nerd Font Complete Mono.ttf" "$HOME/Library/Fonts/"
```

On Linux:

```sh
install -Dm644 "$HOME/.dotfiles/iterm/JetBrains Mono Regular Nerd Font Complete Mono.ttf" "$HOME/.local/share/fonts/JetBrainsMonoNerdFontMono-Regular.ttf"
fc-cache -f "$HOME/.local/share/fonts"
```

Restart Ghostty after installing the font. After later config edits, reload it with `Ctrl+Shift+,` on Linux or `Cmd+Shift+,` on macOS.

## Using the config

- Telescope finds files with `fd` and searches text with `ripgrep`. File search includes hidden files and ignored `.env` files in project directories, but skips dependency and build directories.
- LSP, completion, snippets, Tree-sitter, Git signs, Harpoon, and a terminal are configured. Tree-sitter installs missing supported parsers when you open a file, provided the CLI is installed. Install language tools as needed with `:Mason`; web language servers also need Node. C# requires the .NET SDK and `:MasonInstall roslyn` from the configured custom registry.
- Conform formats on request with `Space lf`: Biome for JavaScript, TypeScript, and JSON; RuboCop's safe auto-corrections for Ruby; and an attached LSP formatter for other files. Use `:ConformInfo` to check formatting.
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
