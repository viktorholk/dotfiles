local M = {}

function M.setup()
  require("conform").setup({
    default_format_opts = {
      lsp_format = "fallback",
    },
    formatters_by_ft = {
      javascript = { "biome" },
      javascriptreact = { "biome" },
      typescript = { "biome" },
      typescriptreact = { "biome" },
      json = { "biome" },
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
