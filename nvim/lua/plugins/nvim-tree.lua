local M = {
  'kyazdani42/nvim-tree.lua',
}

function M.config()
  require('nvim-tree').setup {
    view = {
      width = 35
    },
    diagnostics = {
      enable = true
    }
  }
end

return M
