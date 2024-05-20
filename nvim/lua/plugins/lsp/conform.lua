local M = {}

function M.setup()
  require("conform").setup({
    formatters_by_ft = {
      javascript = { "prettierd" },
    },
  })
end

return M
