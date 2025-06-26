return {
  "folke/which-key.nvim",
  event = "VimEnter",
  keys = {
    -- Harpoon
    { "<leader>z",     group = "Harpoon" },
    { "<leader>za",    function() require("harpoon"):list():add() end,                                    desc = "Add File" },
    { "<leader>zm",    function() require("harpoon").ui:toggle_quick_menu(require("harpoon"):list()) end, desc = "Toggle Menu" },
    { "<leader>z1",    function() require("harpoon"):list():select(1) end,                                desc = "Go to file 1" },
    { "<leader>z2",    function() require("harpoon"):list():select(2) end,                                desc = "Go to file 2" },
    { "<leader>z3",    function() require("harpoon"):list():select(3) end,                                desc = "Go to file 3" },
    { "<leader>z4",    function() require("harpoon"):list():select(4) end,                                desc = "Go to file 4" },

    -- Session
    { "<leader>w",    "<cmd>w<cr>",                                                                      desc = "Write" },
    { "<leader>q",    "<cmd>q<cr>",                                                                      desc = "Quit" },

    -- General
    { "<leader>u",     "<Cmd>UndotreeToggle<CR>",                                                         desc = "Undo Tree" },

    -- File & Telescope
    { "<leader>f",     group = "File" },
    { "<leader>ff",    "<Cmd>Telescope find_files<CR>",                                                   desc = "Find File" },
    { "<leader>fs",    "<Cmd>Telescope live_grep<CR>",                                                    desc = "Live Grep" },
    { "<leader>fb",    "<Cmd>Telescope buffers<CR>",                                                      desc = "Buffers" },
    { "<leader>h",     "<Cmd>Telescope help_tags<CR>",                                                    desc = "Help Tags" },
    { "<leader>e",     "<Cmd>NvimTreeToggle<CR>",                                                         desc = "Toggle File Explorer" },
    { "<leader><S-e>", "<Cmd>NvimTreeFindFile<CR>",                                                       desc = "Find File in Explorer" },

    -- Git
    { "<leader>g",     group = "Git" },
    { "<leader>gn",    "<cmd>Gitsigns next_hunk<CR>",                                                     desc = "Next Hunk" },
    { "<leader>gp",    "<cmd>Gitsigns prev_hunk<CR>",                                                     desc = "Previous Hunk" },
    { "<leader>gs",    "<cmd>Gitsigns stage_hunk<CR>",                                                    desc = "Stage Hunk" },
    { "<leader>gu",    "<cmd>Gitsigns undo_stage_hunk<CR>",                                               desc = "Undo Stage Hunk" },
    { "<leader>grh",   "<cmd>Gitsigns reset_hunk<CR>",                                                    desc = "Reset Hunk" },
    { "<leader>gb",    "<cmd>Gitsigns stage_buffer<CR>",                                                  desc = "Stage Buffer" },
    { "<leader>grb",   "<cmd>Gitsigns reset_buffer<CR>",                                                  desc = "Reset Buffer" },
    { "<leader>gh",    "<cmd>Gitsigns preview_hunk<CR>",                                                  desc = "Preview Hunk" },

    -- LSP
    { "<leader>l",     group = "LSP" },
    { "<leader>ld",    function() vim.diagnostic.open_float() end,                                        desc = "Diagnostics" },

    -- Options
    { "<leader>o",     group = "Options" },
    { "<leader>or",    "<Cmd>set relativenumber!<CR>",                                                    desc = "Toggle Relative Number" },

    -- Terminal
    { "<leader>t",     group = "Terminal" },
    { "<leader>tf",    "<cmd>ToggleTerm direction=float<CR>",                                             desc = "Float" },
    { "<leader>th",    "<cmd>ToggleTerm direction=horizontal<CR>",                                        desc = "Horizontal" },
    { "<leader>tv",    "<cmd>ToggleTerm direction=vertical<CR>",                                          desc = "Vertical" },
  },
}
