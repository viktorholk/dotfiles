local M = {
  'ThePrimeagen/harpoon',
  branch = 'harpoon2'
}

function M.config()
  local harpoon = require("harpoon")

  harpoon:setup()
end

return M
