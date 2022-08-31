local mappings = require('utils/mappings')

-- npm i -g vscode-langservers-extracted typescript typescript-language-server cssmodules-language-server

-- gem install --user-install solargraph
-- 'solargraph bundle' in rails dir

-- Set up completion using nvim_cmp with LSP source
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)
capabilities.textDocument.completion.completionItem.snippetSupport = true

local custom_flags = {
  debounce_text_changes = 150
}

local opts = { noremap = true, silent = true }
vim.keymap.set('n', '<leader>de', vim.diagnostic.open_float, opts)

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local custom_on_attach = function(client, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  local bufopts = { noremap = true, silent = true, buffer = bufnr }

  vim.keymap.set('n', '<leader>lh', vim.lsp.buf.hover, bufopts)
  vim.keymap.set('n', '<leader>lr', vim.lsp.buf.references, bufopts)
  vim.keymap.set('n', '<leader>lf', vim.lsp.buf.formatting, bufopts)
end

-- language_config[1] language name
-- language_config[2] language config
local language_configs = {
  {
    'sumneko_lua',
    {
      settings = {
        Lua = {
          runtime = {
            -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
            version = 'LuaJIT',
          },
          diagnostics = {
            -- Get the language server to recognize the `vim` global
            globals = { 'vim' },
          },
          workspace = {
            -- Make the server aware of Neovim runtime files
            library = vim.api.nvim_get_runtime_file("", true),
          },
          -- Do not send telemetry data containing a randomized but unique identifier
          telemetry = {
            enable = false,
          }
        }
      }
    }
  },
  { 'html' },
  {
    'cssmodules_ls',
    {
      on_attach = function(client, bufnr)
        -- avoid accepting `go-to-definition` responses from this LSP
        client.resolved_capabilities.goto_definition = false
        custom_on_attach(client, bufnr)
      end
    }
  },
  { 'pyright' },
  { 'tsserver' },
  { 'solargraph' }
}

require("mason").setup()
require("mason-lspconfig").setup({
  ensure_installed = (function()
    -- Map language configs to a table with language strings
    local languages = {}
    for _, config in ipairs(language_configs) do
      table.insert(languages, config[1])
    end

    return languages
  end)()
})

local nvim_lsp = require('lspconfig')

-- Setup languages
for _, config in ipairs(language_configs) do
  local language = config[1]

  local options = (function()
    local _options = {
      on_attach    = custom_on_attach,
      flags        = custom_flags,
      capabilities = capabilities
    }

    -- Add additonal settings - will overwrite current options
    local additonal_settings = config[2]

    if additonal_settings then
      for setting, value in pairs(additonal_settings) do
        _options[setting] = value
      end
    end

    return _options
  end)()

  nvim_lsp[language].setup(options)
end
local a = 5

-- diagnostic signs
local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end
