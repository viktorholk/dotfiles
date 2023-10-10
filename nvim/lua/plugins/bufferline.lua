local M = {
  'akinsho/bufferline.nvim'
}

function M.config()
  require('bufferline').setup({
    options = {
      offsets = { { filetype = 'NvimTree', text = 'File Explorer' } },
    }
  })
end

return M
