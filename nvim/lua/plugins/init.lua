return {

  { 'nvim-lua/plenary.nvim' },
  { 'folke/neodev.nvim',    config = true }, -- Better Lua LSP for Neovim configuation

  {
    'rebelot/kanagawa.nvim',
    config = function()
      vim.cmd([[colorscheme kanagawa-dragon]])
    end
  },
  { 'kyazdani42/nvim-web-devicons', config = true },
  { 'windwp/nvim-autopairs',        config = true,      event = "InsertEnter" },

  { 'ThePrimeagen/harpoon',         branch = 'harpoon2' }

}
