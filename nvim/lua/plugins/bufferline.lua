local M = {
  'akinsho/bufferline.nvim'
}

function M.config()
  require('bufferline').setup({
    options = {
      diagnostics = 'nvim_lsp',
      offsets = { { filetype = 'NvimTree', text = 'File Explorer' } },
    }
  })
end

return M
