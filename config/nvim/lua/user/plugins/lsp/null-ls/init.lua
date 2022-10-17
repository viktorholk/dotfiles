local M = {}

local nls = require "null-ls"
local nls_utils = require "null-ls.utils"
local b = nls.builtins

local sources = {
  -- formatting
  b.formatting.prettierd,
  b.formatting.black.with { extra_args = { "--fast" } },
  b.formatting.isort,

  -- diagnostics
  b.diagnostics.write_good,
  b.diagnostics.flake8,
  b.diagnostics.tsc,
}

function M.setup()
  nls.setup {
    -- debug = true,
    debounce = 150,
    save_after_format = false,
    sources = sources,
    on_attach = require("user.plugins.lsp.handlers").on_attach,
    root_dir = nls_utils.root_pattern ".git",
  }
end

return M
