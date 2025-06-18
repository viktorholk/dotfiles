local mappings = require('utils.mappings')

local nnoremap = mappings.nnoremap


local M = {
  'lewis6991/gitsigns.nvim',
}

function M.config()
  require('gitsigns').setup({
    current_line_blame_opts = {
      virt_text_pos = 'right_align', -- 'eol' | 'overlay' | 'right_align'
    },
    current_line_blame = true,
    on_attach = function()
    end
  })
end

return M
