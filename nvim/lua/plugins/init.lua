return {

  { 'nvim-lua/plenary.nvim' },

  { 'rebelot/kanagawa.nvim', lazy = false, config = function() vim.cmd([[colorscheme kanagawa]]) end },
  { 'goolord/alpha-nvim', config = function() require 'alpha'.setup(require 'alpha.themes.startify'.config) end },
  { 'kyazdani42/nvim-web-devicons', config = true },
  { 'windwp/nvim-autopairs', config = true },
  { 'mbbill/undotree' },
}
