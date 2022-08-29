-- npm i -g vscode-langservers-extracted
-- npm install -g typescript typescript-language-server

-- gem install --user-install solargraph
-- 'solargraph bundle' in rails dir

-- Set up completion using nvim_cmp with LSP source
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)
capabilities.textDocument.completion.completionItem.snippetSupport = true

local flags = {
  debounce_text_changes = 150
}

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
              globals = {'vim'},
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
    {
      'html',
      {
        capabilities = capabilities
      }
    },
    {'pyright'},
    {'tsserver'},
    {'solargraph'}
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

local nvim_lsp  = require('lspconfig')
local navic     = require('nvim-navic') -- show current code context

local on_attach = function(client, bufnr)
    navic.attach(client, bufnr)
end

-- Setup languages
for _, config in ipairs(language_configs) do
  local language = config[1]

  local options = (function()
    local _options = {
      on_attach = on_attach
    }

    local additonal_settings = config[2]

    if additonal_settings then
      for setting, value in pairs(additonal_settings) do
        _options[setting] = value
      end
      -- add default values
      _options['flags'] = additonal_settings['flags'] or flags
    end

    return _options
  end)()

  nvim_lsp[language].setup(options)
end
