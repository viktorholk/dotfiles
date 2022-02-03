syntax on

set encoding=UTF-8
set mouse=a
set noerrorbells
set tabstop=2 softtabstop=2
set shiftwidth=2
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

set updatetime=300
set cmdheight=2
set shortmess+=c

" Use tab or trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

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
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'jiangmiao/auto-pairs'
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

nnoremap <leader>q :quit<CR>
nnoremap <leader>w :update<CR>

" Redraw screen
nnoremap <leader>c :nohl<CR>

nnoremap <leader>h :UndotreeToggle<CR>
nnoremap <leader>z :NERDTreeToggle<CR>
nnoremap <leader>f :Files<CR>

nnoremap <leader>t :terminal<CR>
tnoremap <leader>T <C-\><C-n>


