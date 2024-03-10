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
      local gs = package.loaded.gitsigns

      -- Navigation
      nnoremap('<leader>gn', function()
        if vim.wo.diff then return 'gp' end
        vim.schedule(function() gs.next_hunk() end)
        return '<Ignore>'
      end)

      nnoremap('<leader>gp', function()
        if vim.wo.diff then return 'gn' end
        vim.schedule(function() gs.prev_hunk() end)
        return '<Ignore>'
      end)


      -- Actions
      nnoremap('<leader>gs', gs.stage_hunk)
      nnoremap('<leader>gu', gs.undo_stage_hunk)
      nnoremap('<leader>grh', gs.reset_hunk)
      nnoremap('<leader>gb', gs.stage_buffer)
      nnoremap('<leader>grb', gs.reset_buffer)
      nnoremap('<leader>gh', gs.preview_hunk)
    end
  })
end

return M
