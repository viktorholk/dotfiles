local M = {
  "mason-org/mason-lspconfig.nvim",
  dependencies = {
    { "mason-org/mason.nvim", opts = {} },
    'neovim/nvim-lspconfig',
    'stevearc/conform.nvim' -- Formatter
  }
}

function M.config()
  require('plugins.lsp.handlers').setup()
  require('plugins.lsp.conform').setup()
  require('plugins.lsp.mason')
end

return M
