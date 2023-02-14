local M = {
  'nvim-lualine/lualine.nvim',
  dependencies = {
    'kyazdani42/nvim-web-devicons'
  }
}

function M.config()
  require('lualine').setup {
    options = {
      component_separators = { left = '|', right = '|' },
      section_separators = { left = '', right = '' },
      disabled_filetypes = {
        'NvimTree'
      }
    }
  }
end

return M
