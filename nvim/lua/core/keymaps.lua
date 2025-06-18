local mappings = require('utils.mappings')

local nnoremap = mappings.nnoremap

-- Set leader to space
vim.g.mapleader = ' '

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
