local mason = require('mason')
local mason_lspconfig = require('mason-lspconfig')

local servers = {
  'lua_ls',
  'html',
  'cssls',
  'jsonls',
  'ts_ls',
  'tailwindcss',
  'eslint',
  'solargraph',
  'rust_analyzer',
  'omnisharp'
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
  automatic_enable = false
}

for _, server_name in ipairs(servers) do
  local opts = {
    on_attach = require("plugins.lsp.handlers").on_attach,
    capabilities = require("plugins.lsp.handlers").capabilities,
    flags = { debounce_text_changes = 300 }
  }

  local require_ok, server = pcall(require, "plugins.lsp.settings." .. server_name)
  if require_ok then
    opts = vim.tbl_deep_extend("force", server, opts)
  end

  --vim.lsp.config(server_name, opts)
  --vim.lsp.enable({ server_name })
  require('lspconfig')[server_name].setup(opts)
end
