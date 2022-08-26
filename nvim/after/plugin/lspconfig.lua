--vim.lsp.set_log_level("debug")

require("mason").setup()
require("mason-lspconfig").setup({
  ensure_installed = {
    'sumneko_lua',
    'html',
    'pyright',
    'tsserver',
    'solargraph'
  }
})
local nvim_lsp = require('lspconfig')

-- Set up completion using nvim_cmp with LSP source
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)
capabilities.textDocument.completion.completionItem.snippetSupport = true

nvim_lsp.sumneko_lua.setup {
  settings = {
    Lua = {
      runtime = {
        -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
        version = 'LuaJIT',
      },
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = {'vim'},
      },
      workspace = {
        -- Make the server aware of Neovim runtime files
        library = vim.api.nvim_get_runtime_file("", true),
      },
      -- Do not send telemetry data containing a randomized but unique identifier
      telemetry = {
        enable = false,
      },
    },
  }
}

-- npm i -g vscode-langservers-extracted
nvim_lsp.html.setup {
  capabilities = capabilities
}

nvim_lsp.pyright.setup{}

-- npm install -g typescript typescript-language-server
nvim_lsp.tsserver.setup{}

-- gem install --user-install solargraph
-- solargraph bundle in rails dir
nvim_lsp.solargraph.setup{}


