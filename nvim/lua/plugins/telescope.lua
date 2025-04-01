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
            file_ignore_patterns = { "node_modules", ".git" },
            -- Better performance settings
            preview = {
                treesitter = false,
            },
            vimgrep_arguments = {
                "rg",
                "--follow", -- Follow symbolic links
                "--hidden", -- Search for hidden files
                "--no-heading", -- Don't group matches by each file
                "--with-filename", -- Print the file path with the matched lines
                "--line-number", -- Show line numbers
                "--column", -- Show column numbers
                "--smart-case", -- Smart case search
            }
        },
        pickers = {
            find_files = {
                theme = 'ivy',
                hidden = true,
                find_command = {
                    "sh", "-c",
                    'fd --type f --hidden --exclude .git --exclude node_modules . ; fd --type f --hidden --no-ignore --glob ".env" .'
                }
            },
            live_grep = {
                theme = 'ivy'
            },
            buffers = {
                theme = 'ivy'
            }
        },
        extensions = {
            fzf = {
                fuzzy = true,           -- false will only do exact matching
                override_generic_sorter = true, -- override the generic sorter
                override_file_sorter = true, -- override the file sorter
                case_mode = "smart_case", -- or "ignore_case" or "respect_case"
                -- the default case_mode is "smart_case"
            }
        }
    }
    telescope.load_extension('fzf')
end

return M
