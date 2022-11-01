local colorscheme = 'base16-tomorrow-night'
--local colorscheme = 'base16-eighties'
vim.opt.background = 'dark'

pcall(vim.cmd, 'colorscheme ' .. colorscheme)
