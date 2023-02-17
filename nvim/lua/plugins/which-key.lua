local M = {
  'folke/which-key.nvim',
}

function M.config()
  local which_key = require('which-key')

  which_key.setup {
    icons = {
      group = "", -- symbol prepended to a group
    },
    layout= {
      align = 'center'
    }
  }

  -- Add labels to keybindings
  which_key.register({
    e = 'Toggle File Explorer',
    u = 'Toggle Undo Tree',
    w = 'Write Buffer',
    q = 'Quit',
    h = 'Help Tags',
    f = {
      name = 'Telescope',
      f = 'Find Files',
      s = 'Search in Files',
      b = 'Find Buffers',
      h = {
        name = 'Hidden',
        f = {
          'Find Files'
        }
      }
    },
    l = {
      name = 'LSP',
      h = 'Hover Cursor',
      r = 'Open References',
      f = 'Format Buffer',
      d = 'Open Diagnostics',
      g = 'Goto Definition'
    }
  }, { prefix = "<leader>" })
end

return M
