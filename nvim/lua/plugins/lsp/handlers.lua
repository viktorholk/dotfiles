local cmp_nvim_lsp = require('cmp_nvim_lsp')
local mappings = require('utils.mappings')

local nnoremap = mappings.nnoremap

local M = {}

M.capabilities = vim.lsp.protocol.make_client_capabilities()
M.capabilities.textDocument.completion.completionItem.snippetSupport = true
M.capabilities = cmp_nvim_lsp.default_capabilities(M.capabilities)

M.flags = {
  debounce_text_changes = 150
}

M.on_attach = function(client, bufnr)
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- LSP Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  local bufopts = { noremap = true, silent = true, buffer = bufnr }

  nnoremap('<leader>lg', vim.lsp.buf.definition, bufopts)
  nnoremap('<leader>lh', vim.lsp.buf.hover, bufopts)
  nnoremap('<leader>lr', vim.lsp.buf.references, bufopts)
  nnoremap('<leader>lc', vim.lsp.buf.code_action, bufopts)
  nnoremap('<leader>lf', function() vim.lsp.buf.format { async = true } end, bufopts)
end

M.setup = function()
  local signs = { Error = "", Warn = "", Hint = "", Info = "" }
  for type, icon in pairs(signs) do
    local hl = "DiagnosticSign" .. type
    vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
  end

  local config = {
    virtual_text = false,
    -- show signs
    signs = {
      active = signs,
    },
    update_in_insert = true,
    underline = false,
    severity_sort = true,
    float = {
      focusable = false,
      style = "minimal",
      border = "rounded",
      source = "always",
      header = "",
      prefix = "",
    },
  }

  vim.diagnostic.config(config)
end

return M
