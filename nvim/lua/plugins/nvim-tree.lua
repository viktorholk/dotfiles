local M = {
  'kyazdani42/nvim-tree.lua',
}

function M.config()
  require('nvim-tree').setup {
    view = {
      width = 50
    },
    diagnostics = {
      enable = true
    },
    filters = { custom = { "^.git$" } }
  }
end

return M
