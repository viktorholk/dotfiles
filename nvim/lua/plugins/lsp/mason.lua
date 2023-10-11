local mason = require('mason')
local mason_lspconfig = require('mason-lspconfig')
local lspconfig = require('lspconfig')

local servers = {
  'lua_ls',
  'html',
  'cssls',
  'jsonls',
  'tsserver',
  'eslint',
  'volar',
  'solargraph',
  'jedi_language_server' -- python
}

mason.setup {
  ui = {
    border = "single",
    icons = {
      package_installed = "✓",
      package_pending = "",
      package_uninstalled = "➜",
    },
  },
}

mason_lspconfig.setup {
  ensure_installed = servers
}

mason_lspconfig.setup_handlers {
  function(server_name)
    local opts = {
      on_attach    = require("plugins.lsp.handlers").on_attach,
      capabilities = require("plugins.lsp.handlers").capabilities,
    }

    local require_ok, server = pcall(require, "plugins.lsp.settings." .. server_name)
    if require_ok then
      opts = vim.tbl_deep_extend("force", server, opts)
    end

    lspconfig[server_name].setup(opts)
  end
}
