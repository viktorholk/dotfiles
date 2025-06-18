local M = {
  'ThePrimeagen/harpoon',
  branch = 'harpoon2'
}

function M.config()
  local harpoon = require("harpoon")

  -- REQUIRED
  harpoon:setup()
  -- REQUIRED
end

return M
