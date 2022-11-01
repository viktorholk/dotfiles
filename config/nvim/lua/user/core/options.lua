-- Visual
vim.opt.cmdheight     = 1
vim.opt.pumheight     = 10
vim.opt.showmode      = false
vim.opt.showtabline   = 2 -- Always show tabline
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
vim.opt.tabstop       = 4
vim.opt.softtabstop   = 4
vim.opt.shiftwidth    = 4
vim.opt.splitbelow    = true
vim.opt.splitright    = true
vim.opt.scrolloff     = 12 -- Minimum offset in lines to screen borders
vim.opt.sidescrolloff = 8
vim.opt.mouse         = 'a'
vim.opt.shortmess     = vim.o.shortmess .. "c" -- Don't continue comments on space
vim.opt.clipboard     = 'unnamedplus'
vim.opt.completeopt   = { 'menuone', 'noselect' } -- For nvim-cmp
vim.opt.undofile      = true

-- Vim specific
vim.opt.fileencoding = 'utf-8'
vim.opt.backup       = true
vim.opt.backupdir    = '~/.vim/backup//'
vim.opt.directory    = '~/.vim/swap//'
vim.opt.undodir      = '~/.vim/undo//'
vim.opt.hidden       = true -- Do not save when switching buffers
vim.opt.updatetime   = 100
vim.opt.timeoutlen   = 500

-- Remove line numbers in terminal
vim.api.nvim_create_autocmd('TermOpen', { pattern = "*", command = 'setlocal nonumber norelativenumber' })

-- tricky way ro disable autocomment in neovim lua
vim.cmd("autocmd BufEnter * set formatoptions-=cro")
vim.cmd("autocmd BufEnter * setlocal formatoptions-=cro")
