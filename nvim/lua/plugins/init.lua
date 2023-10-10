return {

  { 'nvim-lua/plenary.nvim' },
  { 'folke/neodev.nvim',            config = true }, -- Better Lua LSP for Neovim configuation

  { 'kyazdani42/nvim-web-devicons', config = true },
  { 'windwp/nvim-autopairs',        config = true },
  { 'rebelot/kanagawa.nvim',        config = function() vim.cmd([[colorscheme kanagawa]]) end },
  { 'goolord/alpha-nvim',           config = function() require 'alpha'.setup(require 'alpha.themes.startify'.config) end },
  { 'zbirenbaum/copilot.lua',       config = true },
  { 'zbirenbaum/copilot-cmp',       config = true }
}
