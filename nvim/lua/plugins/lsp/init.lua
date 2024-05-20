local M = {
  'neovim/nvim-lspconfig', -- Enable LSP
  dependencies = {
    'williamboman/mason.nvim', -- LSP Installer
    'williamboman/mason-lspconfig.nvim', -- LSP configuration
    'stevearc/conform.nvim' -- Formatter
  }
}

function M.config()
  require('plugins.lsp.handlers').setup()
  require('plugins.lsp.conform').setup()
  require('plugins.lsp.mason')
end

return M
