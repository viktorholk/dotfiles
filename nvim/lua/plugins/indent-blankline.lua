local M = {
  'lukas-reineke/indent-blankline.nvim',
}

function M.config()
  require('ibl').setup({
    indent = {
      char = "▏",

    },
    scope = {
      char = "▎",
      show_start = false,
      show_end = false
    }
  })
end

return M
