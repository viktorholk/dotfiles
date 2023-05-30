local M = {
  'nvim-treesitter/nvim-treesitter',
  build = ':TSUpdate',
}

function M.config()
  require('nvim-treesitter.configs').setup({
    ensure_installed = { "c", "lua", "vim", "vimdoc" },
    -- Automatically install missing parsers when entering buffer
    auto_install = true,
    highlight = {
      enable = true,
      disable = { "vue" }
    }
  })
end

return M
