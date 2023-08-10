local M = {}

local nls = require "null-ls"
local nls_utils = require "null-ls.utils"
local b = nls.builtins

local sources = {
  -- formatting
  b.formatting.prettierd,
  b.formatting.isort,
  b.formatting.autopep8,

  -- diagnostics
  b.diagnostics.tsc,
  b.diagnostics.flake8,
}

function M.setup()
  nls.setup {
    -- debug = true,
    debounce = 150,
    save_after_format = false,
    sources = sources,
    on_attach = require("plugins.lsp.handlers").on_attach,
    root_dir = nls_utils.root_pattern ".git",
  }
end

return M
