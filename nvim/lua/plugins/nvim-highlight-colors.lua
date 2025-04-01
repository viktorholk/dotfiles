local M = {
  'brenoprata10/nvim-highlight-colors',
}

function M.config()
  require('nvim-highlight-colors').setup({
    render = 'virtual',
    virtual_symbol = '■',
    enable_named_colors = false,
    enable_tailwind = true,

  })
end

return M
