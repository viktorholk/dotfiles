local mappings = require('utils.mappings')

local nnoremap = mappings.nnoremap

-- Set leader to space
vim.g.mapleader = ' '

-- General
nnoremap('<leader>w', '<Cmd>write<CR>') -- Write buffer
nnoremap('<leader>q', '<Cmd>bd | bp<CR>') -- Close buffer

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
nnoremap('<leader><S-e>', '<Cmd>NvimTreeFindFile<CR>')

-- Undo Tree
nnoremap('<leader>u', '<Cmd>UndotreeToggle<CR>')

-- Telescope
nnoremap('<leader>ff', '<Cmd>Telescope find_files <CR>')
nnoremap('<leader>fs', '<Cmd>Telescope live_grep <CR>')
nnoremap('<leader>fb', '<Cmd>Telescope buffers <CR>')
nnoremap('<leader>h', '<Cmd>Telescope help_tags<CR>')


-- Options
nnoremap('<leader>or', '<Cmd>set relativenumber!<CR>')

-- Diagnostics
nnoremap('<leader>ld', vim.diagnostic.open_float)
