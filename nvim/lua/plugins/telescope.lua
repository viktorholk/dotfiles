local M = {
  'nvim-telescope/telescope.nvim',
  dependencies = {
    { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' }
  }
}

function M.config()
  local telescope = require('telescope')
  telescope.setup {
    defaults = {
      file_ignore_patterns = { "node_modules" },
      -- Better performance settings
      preview = {
        treesitter = false,
      },
      vimgrep_arguments = {
        "rg",
        "--color=never",
        "--no-heading",
        "--with-filename",
        "--line-number",
        "--column",
        "--smart-case",
      }
    },
    pickers = {
      find_files = {
        hidden = true,
        find_command = { 'rg', '--files', '--hidden', '-g', '!.git', '-u' },
        theme = 'ivy'
      },
      live_grep = {
        hidden = true,
        theme = 'ivy'
      },
      buffers = {
        theme = 'ivy'
      }
    },
    extensions = {
      fzf = {
        fuzzy = true,                   -- false will only do exact matching
        override_generic_sorter = true, -- override the generic sorter
        override_file_sorter = true,    -- override the file sorter
        case_mode = "smart_case",       -- or "ignore_case" or "respect_case"
        -- the default case_mode is "smart_case"
      }
    }
  }
  telescope.load_extension('fzf')
end

return M
