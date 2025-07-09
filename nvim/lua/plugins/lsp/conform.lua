local M = {}

function M.setup()
  require("conform").setup({
    formatters_by_ft = {
      javascript = { "prettierd", "prettier" },
      typescript = { "prettierd", "prettier" },
      ruby = { "rubocop" },
    },
    formatters = {
      rubocop = {
        command = "rubocop",
        args = { "--auto-correct-all", "--stdin", "$FILENAME" },
        stdin = true,
      },
    },
  })
end

return M
