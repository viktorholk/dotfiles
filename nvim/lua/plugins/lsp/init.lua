local M = {
  "mason-org/mason.nvim",
  dependencies = {
    'neovim/nvim-lspconfig',
    'stevearc/conform.nvim',
  },
}

function M.config()
  require('plugins.lsp.handlers').setup()
  require('plugins.lsp.conform').setup()
  require('plugins.lsp.mason')
end

return M
