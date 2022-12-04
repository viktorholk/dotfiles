local status_ok, which_key = pcall(require, 'which-key')
if not status_ok then
  return
end

which_key.setup {
  icons = {
    group = "", -- symbol prepended to a group
  },
  window = {
    border = "single", -- none, single, double, shadow
  },
  ignore_missing = false, -- enable this to hide mappings for which you didn't specify a label
}

-- Add labels to keybindings
which_key.register({
  e = 'Toggle Tree',
  w = 'Write File',
  q = 'Close Buffer',
  x = 'Quit',
  t = {
    name = "Terminal & Tabs",
    t = 'Toggle Terminal',
    n = 'New Tab'
  },
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
  d = {
    name = 'Diagnostics',
    f = 'Open Float'
  },
  l = {
    name = 'LSP',
    h = 'Hover Cursor',
    r = 'Open References',
    f = 'Format File'
  }

}, { prefix = "<leader>" })
