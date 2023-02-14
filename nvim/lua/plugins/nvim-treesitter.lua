local M = {
  'nvim-treesitter/nvim-treesitter',
  build = ':TSUpdate',
}

function M.config()
  require('nvim-treesitter.configs').setup({
    ensure_installed = { "c", "lua", "vim", "help" },
    -- Automatically install missing parsers when entering buffer
    auto_install = true,

    highlight = {
      enable = true,
    }
  })
end

return M
