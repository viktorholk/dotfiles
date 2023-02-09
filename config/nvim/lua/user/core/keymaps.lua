local mappings = require('user.utils.mappings')

local nnoremap = mappings.nnoremap
local tnoremap = mappings.tnoremap

-- Set leader to space
vim.g.mapleader = ' '

-- General
nnoremap('<leader>w', '<Cmd>write<CR>') -- Write buffer
nnoremap('<leader>q', '<Cmd>bd<CR>') -- close current buffer
nnoremap('<leader>x', '<Cmd>quit<CR>') -- Quit

-- Window navigation
nnoremap('<C-j>', '<C-w>j') -- Down
nnoremap('<C-k>', '<C-w>k') -- Up
nnoremap('<C-h>', '<C-w>h') -- Left
nnoremap('<C-l>', '<C-w>l') -- Right

-- Tabs
nnoremap('<leader>.', '<Cmd>tabnew<CR>') -- Create new tab

-- Code navigation
nnoremap('<S-k>', '<PageUp>')
nnoremap('<S-j>', '<PageDown>')

-- File explorer
nnoremap('<leader>e', '<Cmd>NvimTreeToggle<CR>')
-- Telescope
nnoremap('<leader>ff', '<Cmd>Telescope find_files theme=dropdown<CR>')
nnoremap('<leader>fhf', '<Cmd>Telescope find_files hidden=true theme=dropdown<CR>')
nnoremap('<leader>fs', '<Cmd>Telescope live_grep theme=dropdown<CR>')
nnoremap('<leader>fb', '<Cmd>Telescope buffers theme=dropdown<CR>')

-- Terminal
nnoremap('<leader>tt', '<Cmd>ToggleTerm<CR>')
tnoremap('<C-ESC>', '<C-\\><C-n>') -- Go out terminal mode
