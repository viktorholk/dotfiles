local cmp_nvim_lsp = require('cmp_nvim_lsp')

local M = {}

M.capabilities = vim.lsp.protocol.make_client_capabilities()
M.capabilities = cmp_nvim_lsp.default_capabilities(M.capabilities)
M.capabilities.textDocument.completion.completionItem.snippetSupport = true

M.setup = function()
  local lsp_mappings = vim.api.nvim_create_augroup("LspMappings", { clear = true })

  vim.api.nvim_create_autocmd("LspAttach", {
    group = lsp_mappings,
    callback = function(event)
      local function map(lhs, rhs, desc)
        vim.keymap.set("n", lhs, rhs, {
          buffer = event.buf,
          desc = desc,
          silent = true,
        })
      end

      map("<leader>lg", vim.lsp.buf.definition, "Go to Definition")
      map("<leader>lh", vim.lsp.buf.hover, "Hover")
      map("<leader>lr", vim.lsp.buf.references, "Find References")
      map("<leader>lc", vim.lsp.buf.code_action, "Code Action")
    end,
  })

  vim.diagnostic.config({
    virtual_text = false,
    signs = {
      text = {
        [vim.diagnostic.severity.ERROR] = " ",
        [vim.diagnostic.severity.WARN] = " ",
        [vim.diagnostic.severity.INFO] = "󰋼 ",
        [vim.diagnostic.severity.HINT] = "󰌵 ",
      },
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
  })
end

return M
