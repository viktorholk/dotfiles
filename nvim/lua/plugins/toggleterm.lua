local M = {
  'akinsho/toggleterm.nvim',
}

function M.config()
  require('toggleterm').setup {
    open_mapping = [[<c-t>]],
    direction = 'float',
    float_opts = {
      border = 'single',
      height = 50
    }
  }
end

return M
