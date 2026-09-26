-- Visual
vim.opt.cmdheight     = 1
vim.opt.pumheight     = 10
vim.opt.showmode      = false
vim.opt.showtabline   = 2 -- Always show tabline
vim.opt.laststatus    = 3
vim.opt.title         = true
vim.opt.termguicolors = true -- Use true colors, required for some plugins
vim.wo.number         = true
vim.wo.relativenumber = true
vim.wo.signcolumn     = 'yes'
vim.wo.cursorline     = true
-- Behaviour
vim.opt.hlsearch      = false
vim.opt.ignorecase    = true -- Ignore case when using lowercase in search
vim.opt.smartcase     = true -- But don't ignore it when using upper case
vim.opt.smarttab      = true
vim.opt.smartindent   = true
vim.opt.expandtab     = true -- Convert tabs to spaces.
vim.opt.tabstop       = 2
vim.opt.softtabstop   = 2
vim.opt.shiftwidth    = 2
vim.opt.foldmethod    = 'indent'
vim.opt.foldlevel     = 99
vim.opt.splitbelow    = true
vim.opt.splitright    = true
vim.opt.scrolloff     = 12 -- Minimum offset in lines to screen borders
vim.opt.sidescrolloff = 8
vim.opt.mouse         = 'a'
vim.opt.clipboard     = 'unnamedplus'
vim.opt.completeopt   = { 'menuone', 'noselect' } -- For nvim-cmp
vim.opt.undofile      = true
vim.opt.guicursor     = "i:block-blinkwait1000-blinkon500-blinkoff500";

-- Vim specific
vim.opt.fileencoding  = 'utf-8'
vim.opt.backup        = true

local state = vim.fn.stdpath('state')
for _, dir in ipairs({ 'backup', 'swap', 'undo' }) do
  vim.fn.mkdir(state .. '/' .. dir, 'p')
end
vim.opt.backupdir     = state .. '/backup//'
vim.opt.directory     = state .. '/swap//'
vim.opt.undodir       = state .. '/undo//'

vim.opt.hidden        = true -- Do not save when switching buffers
vim.opt.updatetime    = 100
vim.opt.timeoutlen    = 250
vim.o.backupcopy      = 'yes'

vim.cmd("autocmd TermOpen * setlocal nonumber norelativenumber")
