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
" Visual 
Plug 'morhetz/gruvbox'
Plug 'airblade/vim-gitgutter'
'
" Panels
Plug 'preservim/nerdtree'
Plug 'mbbill/undotree'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" Auto Completions / Helpers
Plug 'jiangmiao/auto-pairs'
Plug 'Valloric/YouCompleteMe'
Plug 'terryma/vim-multiple-cursors'

" Language Support
Plug 'vim-ruby/vim-ruby'
Plug 'tpope/vim-rails'

call plug#end()

colorscheme gruvbox
set background=dark

let mapleader = " "
let g:ycm_autoclose_preview_window_after_completion = 1
let NERDTreeShowHidden = 1

nnoremap <leader>h :UndotreeToggle<CR>
nnoremap <leader>z :NERDTreeToggle<CR>
nnoremap <leader>f :Files<CR>
