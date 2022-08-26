local languages = {
    'sumneko_lua',
    'html',
    'pyright',
    'tsserver',
    'solargraph'
}

require("mason").setup()
require("mason-lspconfig").setup({
  ensure_installed = languages
})

local nvim_lsp  = require('lspconfig')
local navic     = require('nvim-navic')

local on_attach = function(client, bufnr)
    navic.attach(client, bufnr)
end

-- Set up completion using nvim_cmp with LSP source
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)
capabilities.textDocument.completion.completionItem.snippetSupport = true

-- npm i -g vscode-langservers-extracted
-- npm install -g typescript typescript-language-server

-- gem install --user-install solargraph
-- 'solargraph bundle' in rails dir

for _, language in ipairs(languages) do
  local options = {
    on_attach = on_attach,
    capabilities = capabilities,
    flags = {
      debounce_text_changes = 150
    }
  }

  nvim_lsp[language].setup(options)
end
