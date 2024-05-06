local M = {
  'kyazdani42/nvim-tree.lua',
}

function M.config()
  require('nvim-tree').setup({
    sort = {
      sorter = "case_sensitive",
    },
    view = {
      width = 45,
    },
    renderer = {
      group_empty = true,
    },
    filters = {
      exclude = { '.env' }
    }
  })
end

return M
