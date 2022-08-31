local mappings = require('utils/mappings')

--local vnoremap = Mapping.vnoremap
--local inoremap = Mapping.inoremap
local nnoremap = mappings.nnoremap
local tnoremap = mappings.tnoremap

-- Set leader to <Space>
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- General
nnoremap('<leader><ESC>', '<Cmd>quit<CR>')
nnoremap('<leader>w', '<Cmd>write<CR>')
nnoremap('<leader>.', '<Cmd>tabnew<CR>') -- new tab

-- Terminal
nnoremap('<leader>-', '<Cmd>term<CR>i') -- Open terminal and go to insert terminal mode
tnoremap('<ESC>', '<C-\\><C-n>') -- Close terminal with ESC

-- Code navigation
nnoremap('<C-j>', '<PageDown>')
nnoremap('<C-k>', '<PageUp>')

-- Tab navigation
nnoremap('<C-l>', 'gt')
nnoremap('<C-h>', 'gT')

-- Telescope
nnoremap('<leader>ff', '<Cmd>Telescope find_files<CR>')
nnoremap('<leader>fhf', '<Cmd>Telescope find_files hidden=true<CR>')
nnoremap('<leader>fb', '<Cmd>Telescope buffers<CR>')
nnoremap('<leader>fs', '<Cmd>Telescope live_grep<CR>')

-- File explorer
nnoremap('<leader>e', '<Cmd>NvimTreeToggle<CR>')

