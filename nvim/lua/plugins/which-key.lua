local M = {
  'folke/which-key.nvim',
}

function M.config()
  local which_key = require('which-key')

  which_key.setup {
    icons = {
      group = "", -- symbol prepended to a group
    },
    layout = {
      align = 'center'
    }
  }

end

return M
