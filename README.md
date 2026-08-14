# Neovim

A Lua-based Neovim setup with LSP, completion, formatting, Telescope,
Tree-sitter, Git signs, Harpoon, and a small set of UI plugins.

## Screenshots

![Neovim dashboard](https://user-images.githubusercontent.com/45604642/227270155-cd76ecb2-c4c6-4461-b5f9-21fbb0e8cfff.png)
![Neovim editor](https://user-images.githubusercontent.com/45604642/227272448-3f558d12-5917-4fa9-ab7b-b19548757b3b.png)
![Neovim file explorer](https://user-images.githubusercontent.com/45604642/227268768-7d38f0d9-067b-46e7-8205-b47af18e2962.png)
![Neovim file search](https://user-images.githubusercontent.com/45604642/227268778-1cc9f1c3-a161-47cf-9bd3-bbd31f474347.png)
![Neovim text search](https://user-images.githubusercontent.com/45604642/227268974-c52c41f2-c514-4f21-9eee-55c689920442.png)
![Neovim terminal](https://user-images.githubusercontent.com/45604642/227268796-1e8dff16-08c9-4b58-8b68-afc0ba468d6c.png)

## Setup

### 1. Install prerequisites

Install Apple's build tools, then the command-line dependencies:

```sh
xcode-select --install
brew install neovim git ripgrep fd node
brew install --cask font-jetbrains-mono-nerd-font
```

This requires Neovim 0.11 or newer. The Nerd Font supplies the UI icons.

### 2. Clone and link the configuration

```sh
git clone https://github.com/viktorholk/dotfiles.git "$HOME/.dotfiles"
mkdir -p "$HOME/.config"
```

Back up an existing Neovim configuration if necessary:

```sh
mv "$HOME/.config/nvim" "$HOME/.config/nvim.backup"
```

Then create the link:

```sh
ln -s "$HOME/.dotfiles/nvim" "$HOME/.config/nvim"
```

The repository can live anywhere; adjust the source path accordingly.

### 3. Start Neovim and install language tools

```sh
nvim
```

lazy.nvim bootstraps itself and installs the plugin versions recorded in
`nvim/lazy-lock.json`. Open `:Mason` and install only the tools required for the
languages you use:

| Language | Mason packages | Additional runtime |
| --- | --- | --- |
| Lua | `lua-language-server` | None |
| HTML/CSS/JSON | `html-lsp`, `css-lsp`, `json-lsp` | Node |
| JavaScript/TypeScript | `typescript-language-server`, `tailwindcss-language-server`, `eslint-lsp`, `biome` | Node |
| Rust | `rust-analyzer` | Rust toolchain |
| Ruby formatting | `rubocop` | Ruby |
| C# | `roslyn` | .NET SDK |

Install only the language tools you need. Roslyn uses the additional Mason
registry already configured in this repository.

Useful checks after setup:

```vim
:checkhealth
:checkhealth mason
:checkhealth telescope
:checkhealth vim.lsp
:ConformInfo
```

## What is configured

- **Appearance:** Kanagawa, true colour, global status line, buffer tabs,
  relative line numbers, cursor line, indent guides, colour previews, and a
  dashboard.
- **Editing:** two-space indentation, smart indentation, system clipboard,
  persistent undo, backups, right/below splits, case-smart search, and generous
  scroll margins. C# uses four spaces.
- **Search:** Telescope searches hidden files with `fd` and searches text with
  `ripgrep`; `.git` and `node_modules` are excluded. File search deliberately
  includes ignored `.env` files, so take care when screen sharing.
- **Code intelligence:** Neovim LSP for Lua, web formats, TypeScript, Tailwind,
  ESLint, Rust, and Roslyn/C#. Completion combines LSP, snippets, buffer text,
  and paths.
- **Formatting:** Biome for JavaScript, TypeScript, and JSON; RuboCop for Ruby;
  other file types fall back to an attached LSP formatter.
- **Git and navigation:** inline Git signs and blame, Harpoon marks, NvimTree,
  Telescope, and bufferline.
- **Syntax:** Tree-sitter highlighting and incremental selection. Highlighting
  is disabled for files larger than 100 KB.
- **Terminal:** ToggleTerm in floating, horizontal, or vertical layouts;
  terminal buffers hide line numbers.

Plugin versions are pinned in `nvim/lazy-lock.json`. Use `:Lazy restore` to
return to those versions.

## Keymaps

The leader key is `Space`. Press it and pause to see the available groups in
which-key.

### Navigation and files

| Key | Action |
| --- | --- |
| `Shift-h` / `Shift-l` | Previous / next buffer |
| `Ctrl-h/j/k/l` | Move to the window left/down/up/right |
| `Shift-k` / `Shift-j` | Page up / page down |
| `Space e` | Toggle file explorer |
| `Space E` | Reveal current file in explorer |
| `Space ff` | Find files |
| `Space fs` | Search text |
| `Space fb` | List buffers |
| `Space h` | Search help tags |
| `Space w` / `Space q` | Write / quit |
| `Space or` | Toggle relative line numbers |

### LSP, completion, and syntax

LSP mappings are available when a language server is attached, except format
and diagnostics, which are always available.

| Key | Mode | Action |
| --- | --- | --- |
| `Space lg` | Normal | Go to definition |
| `Space lh` | Normal | Show hover information |
| `Space lr` | Normal | Find references |
| `Space lc` | Normal | Code action |
| `Space ld` | Normal | Show line diagnostics |
| `Space lf` | Normal | Format with Conform/LSP |
| `Ctrl-Space` | Insert | Open completion menu |
| `Ctrl-b` / `Ctrl-f` | Insert | Scroll completion documentation |
| `Tab` / `Shift-Tab` | Insert/snippet | Next / previous completion or snippet stop |
| `Enter` | Insert | Confirm the explicitly selected completion |
| `Ctrl-e` | Insert | Close completion menu |
| `Ctrl-Space` | Normal/visual | Start or expand Tree-sitter selection |
| `Shift-Space` | Visual | Shrink Tree-sitter selection |

### Git and Harpoon

| Key | Action |
| --- | --- |
| `Space gn` / `Space gp` | Next / previous Git hunk |
| `Space gs` / `Space gu` | Stage hunk / undo staged hunk |
| `Space grh` | Reset hunk |
| `Space gb` / `Space grb` | Stage / reset buffer |
| `Space gh` | Preview hunk |
| `Space za` | Add current file to Harpoon |
| `Space zm` | Toggle Harpoon menu |
| `Space z1` … `Space z4` | Open Harpoon file 1–4 |

### Terminal and dashboard

| Key | Action |
| --- | --- |
| `Ctrl-t` | Toggle the terminal |
| `Space tf` | Floating terminal |
| `Space th` | Horizontal terminal |
| `Space tv` | Vertical terminal |
| `e` / `r` | Dashboard: new file / recent files |
| `s` / `q` | Dashboard: edit config / quit |
