local mappings = require('utils.mappings')

local nnoremap = mappings.nnoremap
local tnoremap = mappings.tnoremap

-- Set leader to space
vim.g.mapleader = ' '

-- General
nnoremap('<leader>w', '<Cmd>write<CR>') -- Write buffer
nnoremap('<leader>q', '<Cmd>bp<bar>sp<bar>bn<bar>bd<CR>') -- close current buffer. Hacky way
nnoremap('<leader>x', '<Cmd>quit<CR>') -- Quit

-- Buffer Navigation
nnoremap('<S-h>', '<Cmd>bprev<CR>')
nnoremap('<S-l>', '<Cmd>bnext<CR>')

-- Window navigation
nnoremap('<C-j>', '<C-w>j') -- Down
nnoremap('<C-k>', '<C-w>k') -- Up
nnoremap('<C-h>', '<C-w>h') -- Left
nnoremap('<C-l>', '<C-w>l') -- Right

-- Code navigation
nnoremap('<S-k>', '<PageUp>')
nnoremap('<S-j>', '<PageDown>')

-- File explorer
nnoremap('<leader>e', '<Cmd>NvimTreeToggle<CR>')

-- Undo Tree
nnoremap('<leader>u', '<Cmd>UndotreeToggle<CR>')

-- Telescope
nnoremap('<leader>ff', '<Cmd>Telescope find_files <CR>')
nnoremap('<leader>fhf', '<Cmd>Telescope find_files hidden=true <CR>')
nnoremap('<leader>fs', '<Cmd>Telescope live_grep <CR>')
nnoremap('<leader>fb', '<Cmd>Telescope buffers <CR>')
