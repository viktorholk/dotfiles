local M = {
  'akinsho/toggleterm.nvim',
}

function M.config()
  require('toggleterm').setup {
    open_mapping = [[<c-t>]],
  }
end

return M
