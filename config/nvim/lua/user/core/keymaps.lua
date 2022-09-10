local mappings = require('user.utils.mappings')

--local vnoremap = Mapping.vnoremap
--local inoremap = Mapping.inoremap
local nnoremap = mappings.nnoremap
local tnoremap = mappings.tnoremap


local function close_buffer()
  local buftype = vim.bo.buftype

  if buftype == 'terminal' then
    vim.cmd[[bdelete!]]
  end
  vim.cmd[[bdelete]]
end


-- Set leader to <Space>
vim.g.mapleader = ' '

-- General
nnoremap('<leader>q', close_buffer) -- close buffer
nnoremap('<leader>w', '<Cmd>write<CR>') -- Write
nnoremap('<leader>.', '<Cmd>tabnew<CR>') -- new tab

-- Window navigation
nnoremap('<C-j>', '<C-w>j')
nnoremap('<C-k>', '<C-w>k')
nnoremap('<C-h>', '<C-w>h')
nnoremap('<C-l>', '<C-w>l')

-- Buffer navigation
nnoremap('<S-l>', '<Cmd>BufferLineCycleNext<CR>')
nnoremap('<S-h>', '<Cmd>BufferLineCyclePrev<CR>')

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
nnoremap('<leader>-', '<Cmd>term<CR>i') -- Open terminal and go to insert terminal mode
tnoremap('<ESC>', '<C-\\><C-n>') -- Close terminal with ESC
