local M = {
  'nvim-treesitter/nvim-treesitter',
  build = ':TSUpdate',
}

function M.config()
  require('nvim-treesitter.configs').setup({
    ensure_installed = {
      "c", "lua", "vim", "vimdoc", "markdown",
      "javascript", "typescript", "html", "css", "scss" },
    -- Automatically install missing parsers when entering buffer
    auto_install = true,
    highlight = {
      enable = true,
    },
    incremental_selection = {
      enable = true,
      keymaps = {
        init_selection = "gnn",
        node_incremental = "grn",
        scope_incremental = "grc",
        node_decremental = "grm",
      },
    },
  })
end

return M
