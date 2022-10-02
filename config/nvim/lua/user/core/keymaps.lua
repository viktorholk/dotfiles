local mappings = require('user.utils.mappings')

local nnoremap = mappings.nnoremap
local tnoremap = mappings.tnoremap

-- Set leader to <Space>
vim.g.mapleader = ' '

-- General
nnoremap(';', '<Cmd>quit<CR>') -- close buffer
nnoremap('<leader>w', '<Cmd>write<CR>') -- Write

-- Window navigation
nnoremap('<C-j>', '<C-w>j')
nnoremap('<C-k>', '<C-w>k')
nnoremap('<C-h>', '<C-w>h')
nnoremap('<C-l>', '<C-w>l')

-- Tabs
nnoremap('<leader>.', '<Cmd>tabnew<CR>') -- Create new tab
nnoremap('<right>', 'gt') -- go to right tab
nnoremap('<left>', 'gT') -- go to left tab
-- Code navigation
nnoremap('<S-k>', '<PageUp>')
nnoremap('<S-j>', '<PageDown>')

-- File explorer
nnoremap('<leader>e', '<Cmd>NvimTreeToggle<CR>')

-- Telescope
nnoremap('<leader>ff', '<Cmd>Telescope find_files<CR>')
nnoremap('<leader>fhf', '<Cmd>Telescope find_files hidden=true<CR>')
nnoremap('<leader>fb', '<Cmd>Telescope buffers<CR>')
nnoremap('<leader>fs', '<Cmd>Telescope live_grep<CR>')

-- Terminal
tnoremap('<ESC>', '<C-\\><C-n>') -- Go out terminal mode
