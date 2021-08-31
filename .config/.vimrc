syntax on

set encoding=UTF-8

set noerrorbells
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set nu
set nowrap
set smartcase
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set incsearch

set colorcolumn=80
highlight ColorColumn ctermbg=0 guibg=lightgrey


call plug#begin('~/.vim/plugged')

Plug 'morhetz/gruvbox'
Plug 'Valloric/YouCompleteMe'
Plug 'preservim/nerdtree'
Plug 'mbbill/undotree'

call plug#end()

colorscheme gruvbox
set background=dark

let mapleader = " "
let g:ycm_autoclose_preview_window_after_insertion = 1

let NERDTreeShowHidden = 1

nnoremap <leader>u :UndotreeShow<CR>
nnoremap <leader>z :NERDTreeToggle<CR>
