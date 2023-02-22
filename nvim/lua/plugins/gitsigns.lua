local M = {
  'lewis6991/gitsigns.nvim',
}

function M.config()
  require('gitsigns').setup({
    numhl = true,
    current_line_blame = true
  })
end

return M
