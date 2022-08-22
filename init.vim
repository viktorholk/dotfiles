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
set nobackup
set nowritebackup
set updatetime=300
set signcolumn=yes
set undodir=~/.vim/undodir
set undofile
set incsearch
set updatetime=300
set cmdheight=2
set shortmess+=c
set foldmethod=indent
set noshowmode
" Allow for paste to also work outside neovim
set clipboard^=unnamed,unnamedplus

" Fix foldings
au BufWinEnter * normal zR

call plug#begin('~/.vim/plugged')
Plug 'morhetz/gruvbox'
Plug 'airblade/vim-gitgutter'
Plug 'itchyny/lightline.vim'

Plug 'preservim/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'

Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.0' }

Plug 'neoclide/coc.nvim', {'branch': 'release'}

Plug 'jiangmiao/auto-pairs'
Plug 'tomtom/tcomment_vim'
Plug 'alvan/vim-closetag'

Plug 'prettier/vim-prettier', { 'do': 'yarn install --frozen-lockfile --production' }

Plug 'pangloss/vim-javascript'
Plug 'leafgarland/typescript-vim'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'ap/vim-css-color'

Plug 'vim-ruby/vim-ruby'
Plug 'tpope/vim-rails'

Plug 'dense-analysis/ale'

call plug#end()

" Configuation
colorscheme gruvbox
set background=dark
let mapleader = " "

" Plugin customization
let NERDTreeShowHidden = 1
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'component_function': {
      \   'filename': 'LightlineFilename',
      \ },
    \ }

function! LightlineFilename()
  let root = fnamemodify(get(b:, 'git_dir'), ':h')
  let path = expand('%:p')
  if path[:len(root)-1] ==# root
    return path[len(root)+1:]
  endif
  return expand('%')
endfunction

let g:unite_force_overwrite_statusline = 0
let g:vimfiler_force_overwrite_statusline = 0
let g:vimshell_force_overwrite_statusline = 0

let g:coc_global_extensions = [
  \ 'coc-html',
  \ 'coc-solargraph',
  \ 'coc-pyright',
  \ 'coc-json',
  \ 'coc-tsserver'
  \ ]

" Mappings
if has('win32') " On Windows you cannot suspend the terminal with CTRL-Z (unbind)
  nmap <C-z> <Nop>
endif

nnoremap <C-j> <PageDown> 
nnoremap <C-k> <PageUp>

nnoremap <leader>q :quit<CR>
nnoremap <leader>w :update<CR>

" Search for files
nnoremap  <leader>f :Telescope find_files<CR>

" Search in current file
nnoremap <leader>s /
" Search in files
nnoremap <leader>S :Telescope live_grep<CR>

" New tab
nnoremap <leader>. :tabnew<CR>

" navigate in tabs left-right
noremap <C-l> gt
noremap <C-h> gT

" Redraw screen
nnoremap <leader>c :nohl<CR>

nnoremap <leader>z :NERDTreeToggle<CR>

"Open terminal
nnoremap <leader>- :term<CR>i

"Close terminal
tnoremap <Esc> <C-\><C-n>

" COC tab completion
" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1):
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice.
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

