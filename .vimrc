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
set foldmethod=indent
au BufWinEnter * normal zR

" Use ripgrep instead of default grep for searching
set grepprg=rg\ --vimgrep\ --smart-case\ --follow

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
" Plugin configuration
colorscheme gruvbox
set background=dark
let NERDTreeShowHidden = 1

" fzf dont search for file name as addition to phrase
command! -bang -nargs=* Rg call fzf#vim#grep("rg --column --line-number --no-heading --color=always --smart-case ".shellescape(<q-args>), 1, {'options': '--delimiter : --nth 4..'}, <bang>0)


" mapleader to space
let mapleader = " "

"" Mappings

" Don't use arrow keys as navigation
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>
" Move line up or down with up and down arrow keys
nnoremap <up> ddkP
nnoremap <down> ddp

" Scroll through page
map <C-j> <PageDown> 
map <C-k> <PageUp>

nnoremap <leader>q :quit<CR>
nnoremap <leader>w :update<CR>

" Search
nnoremap <leader>s /

" New tab
nnoremap <leader>. :tabnew<CR>
" Switch tabs
noremap <S-l> gt
noremap <S-h> gT

" Redraw screen
nnoremap <leader>c :nohl<CR>

nnoremap <leader>z :NERDTreeToggle<CR>
" Search for files
nnoremap <leader>f :Files<CR>
" Search in files 
" Make sure ripgrep is installed
nnoremap <leader>S :Rg<CR>

" Close terminal
tnoremap <leader>T <C-\><C-n>


