local M = {
  'neovim/nvim-lspconfig', -- Enable LSP
  dependencies = {
    'williamboman/mason.nvim', -- LSP Installer
    'williamboman/mason-lspconfig.nvim', -- LSP configuration
    'jose-elias-alvarez/null-ls.nvim'
  }
}

function M.config()
  require('plugins.lsp.handlers').setup()
  require('plugins.lsp.null-ls').setup()
  require('plugins.lsp.mason')
end

return M
