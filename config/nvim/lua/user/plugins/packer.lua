-- Bootstrap
-- Install Packer
local fn = vim.fn
local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim',
    install_path })
  vim.cmd [[packadd packer.nvim]]
end
-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost packer.lua source <afile> | PackerSync
  augroup end
]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init({
  display = {
    open_fn = function()
      return require("packer.util").float({ border = "rounded" })
    end,
  },
})

return require('packer').startup(function(use)
  use { 'wbthomason/packer.nvim' } -- Packer will manage itself
  use { 'lewis6991/impatient.nvim' } -- Speed up Lua modules in Neovim to improve startup time
  use { 'nvim-lua/plenary.nvim' } -- Useful lua functions used by lots of plugins
  use { 'kyazdani42/nvim-tree.lua' } -- File explorer
  use { 'nvim-treesitter/nvim-treesitter' } -- Syntax highligter
  use 'nvim-treesitter/nvim-treesitter-context' -- Show code context

  use { 'windwp/nvim-autopairs' } -- Autopairs
  use { 'terrortylor/nvim-comment' } -- Easy comment
  use { 'akinsho/bufferline.nvim' } -- Tabline
  use { 'tiagovla/scope.nvim' } -- Scope buffers and windows to tabs
  use { 'nvim-lualine/lualine.nvim' } -- Statusline
  use { 'norcalli/nvim-colorizer.lua' } -- Preview colors
  use { 'lewis6991/gitsigns.nvim' } -- Git Signs
  use { 'kyazdani42/nvim-web-devicons' } -- Icons with a NERD Font
  use { 'goolord/alpha-nvim' } -- Startup screen

  use { 'RRethy/nvim-base16' } -- Colorscheme
  -- LSP
  use { 'neovim/nvim-lspconfig' } -- Enable LSP
  use { 'williamboman/mason.nvim' } -- LSP Installer
  use { 'williamboman/mason-lspconfig.nvim' } -- LSP configuration

  -- CMP
  use { 'hrsh7th/nvim-cmp' } -- The completion plugin
  use { 'hrsh7th/cmp-buffer' } -- Buffer completions
  use { 'hrsh7th/cmp-path' } -- Path completions
  use { 'hrsh7th/cmp-cmdline' } -- Cmd completions
  use { 'hrsh7th/cmp-nvim-lsp' } -- LSP completions
  use { 'saadparwaiz1/cmp_luasnip' } -- Snippet completions

  -- Snippes
  use { 'L3MON4D3/LuaSnip' }
  use { 'rafamadriz/friendly-snippets' }

  -- Telescope
  use { 'nvim-telescope/telescope.nvim' }
  use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }

  -- Automatically set up your configuration after cloning packer.nvim
  if packer_bootstrap then
    require('packer').sync()
  end
end)
