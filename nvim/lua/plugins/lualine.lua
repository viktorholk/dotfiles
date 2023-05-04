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
    },
    sections = {
      lualine_c = { { 'filename', path = 1 } },
    },
    inactive_sections = {
      lualine_b = { 'diff', 'diagnostics' },
      lualine_c = { { 'filename', path = 1 } },
    }
  }
end

return M
