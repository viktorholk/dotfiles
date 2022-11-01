local mappings = require('user.utils.mappings')

local nnoremap = mappings.nnoremap
local tnoremap = mappings.tnoremap

-- Set leader to space
vim.g.mapleader = ' '

-- General
nnoremap('<leader>w', '<Cmd>write<CR>') -- Write buffer
nnoremap('<leader>x', '<Cmd>bd<CR>') -- close current buffer
nnoremap('<leader>q', '<Cmd>quit<CR>') -- Quit

-- Window navigation
nnoremap('<C-j>', '<C-w>j') -- Down
nnoremap('<C-k>', '<C-w>k') -- Up
nnoremap('<C-h>', '<C-w>h') -- Left
nnoremap('<C-l>', '<C-w>l') -- Right

-- Tabs
nnoremap('<leader>tn', '<Cmd>tabnew<CR>') -- Create new tab
nnoremap('<left>', 'gT') -- go to left tab
nnoremap('<right>', 'gt') -- go to right tab

-- Code navigation
nnoremap('<S-k>', '<PageUp>')
nnoremap('<S-j>', '<PageDown>')

-- File explorer
nnoremap('<leader>e', '<Cmd>NvimTreeToggle<CR>')
-- Telescope
nnoremap('<leader>ff', '<Cmd>Telescope find_files<CR>')
nnoremap('<leader>fhf', '<Cmd>Telescope find_files hidden=true<CR>')
nnoremap('<leader>fs', '<Cmd>Telescope live_grep<CR>')
nnoremap('<leader>fb', '<Cmd>Telescope buffers<CR>')

-- Terminal
nnoremap('<leader>tt','<Cmd>ToggleTerm<CR>')
tnoremap('<ESC>', '<C-\\><C-n>') -- Go out terminal mode
