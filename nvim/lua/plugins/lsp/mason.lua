local mason = require('mason')

mason.setup {
  registries = {
    "github:mason-org/mason-registry",
    "github:Crashdummyy/mason-registry",
  },
  ui = {
    border = "single",
    icons = {
      package_installed = "✓",
      package_pending = "",
      package_uninstalled = "➜",
    },
  },
}

-- Shared defaults for all LSP servers
vim.lsp.config('*', {
  capabilities = require("plugins.lsp.handlers").capabilities,
  flags = { debounce_text_changes = 300 },
})

-- Per-server overrides
vim.lsp.config("lua_ls", require("plugins.lsp.settings.lua_ls"))
vim.lsp.config("ts_ls", require("plugins.lsp.settings.ts_ls"))
vim.lsp.config("roslyn", require("plugins.lsp.settings.roslyn"))

-- Enable all servers
vim.lsp.enable({
  'lua_ls',
  'html',
  'cssls',
  'jsonls',
  'ts_ls',
  'tailwindcss',
  'eslint',
  'rust_analyzer',
})
