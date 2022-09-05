-- npm i -g vscode-langservers-extracted typescript typescript-language-server cssmodules-language-server
-- gem install --user-install solargraph
-- 'solargraph bundle' in rails dir

-- dotnet tool install --global csharp-ls

local M = {}

local status_cmp_ok, cmp_nvim_lsp = pcall(require, 'cmp_nvim_lsp')
if not status_cmp_ok then
  return
end

local status_navic_ok, nvim_navic = pcall(require, 'nvim-navic')
if not status_navic_ok then
  return
end

M.capabilities = vim.lsp.protocol.make_client_capabilities()
M.capabilities.offsetEncoding = { "utf-16" }
M.capabilities.textDocument.completion.completionItem.snippetSupport = true
M.capabilities = cmp_nvim_lsp.update_capabilities(M.capabilities)


M.on_attach = function(client, bufnr)
  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  local opts = { noremap = true, silent = true, buffer = bufnr }

  vim.keymap.set('n', '<leader>lh', vim.lsp.buf.hover, opts)
  vim.keymap.set('n', '<leader>lr', vim.lsp.buf.references, opts)
  vim.keymap.set('n', '<leader>lf', vim.lsp.buf.formatting, opts)

  nvim_navic.attach(client, bufnr)
end

M.flags = {
  debounce_text_changes = 150
}

M.setup = function()
  local signs = { Error = "", Warn = "", Hint = "", Info = "" }
  for type, icon in pairs(signs) do
    local hl = "DiagnosticSign" .. type
    vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
  end

  local config = {
    -- Enable virtual text
    virtual_text = true,
    -- show signs
    signs = {
      active = signs,
    },
    update_in_insert = true,
    underline = true,
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

  vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
    border = "rounded",
  })

  vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
    border = "rounded",
  })
end


return M
