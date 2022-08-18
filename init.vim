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
set clipboard=unnamed

" Fix foldings
au BufWinEnter * normal zR

call plug#begin('~/.vim/plugged')
" Visual 
Plug 'morhetz/gruvbox'
Plug 'airblade/vim-gitgutter'
Plug 'itchyny/lightline.vim'
'
" Panels
Plug 'preservim/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" Auto Completions / Helpers
Plug 'neoclide/coc.nvim', {'branch': 'release'}
let g:coc_global_extensions = [
  \ 'coc-html',
  \ 'coc-solargraph',
  \ 'coc-pyright',
  \ 'coc-json',
  \ 'coc-tsserver'
  \ ]
Plug 'jiangmiao/auto-pairs'

" post install (yarn install | npm install) then load plugin only for editing supported files
" npm install -g prettier
Plug 'prettier/vim-prettier', { 'do': 'yarn install --frozen-lockfile --production' }
let g:prettier#autoformat = 0
autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue,*.yaml,*.html PrettierAsync

" Language Support & linting
" JS / TS / CSS
Plug 'pangloss/vim-javascript'
Plug 'leafgarland/typescript-vim'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'ap/vim-css-color'
" Ruby & Rails
Plug 'vim-ruby/vim-ruby'
Plug 'tpope/vim-rails'
" Vue
Plug 'posva/vim-vue'
Plug 'digitaltoad/vim-pug'
" Async lint engine
Plug 'dense-analysis/ale'

call plug#end()
" mapleader to space
let mapleader = " "

" Plugin configuration
colorscheme gruvbox
set background=dark
let NERDTreeShowHidden = 1

" Show filename in lightLine
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

" fzf dont search for file name as addition to phrase
command! -bang -nargs=* Rg call fzf#vim#grep("rg --column --line-number --no-heading --color=always --smart-case ".shellescape(<q-args>), 1, {'options': '--delimiter : --nth 4..'}, <bang>0)

"" Mappings
" Disable arrow keys for all modes
for key in ['<Up>', '<Down>', '<Left>', '<Right>']
  exec 'noremap' key '<Nop>'
  exec 'inoremap' key '<Nop>'
  exec 'cnoremap' key '<Nop>'
endfor

" Scroll through page
map <C-j> <PageDown> 
map <C-k> <PageUp>

nnoremap <leader>q :quit<CR>
nnoremap <leader>w :update<CR>

" Search
nnoremap <leader>s /
" Search in files 
" Make sure ripgrep is installed
nnoremap <leader>S :Rg<CR>

" New tab
nnoremap <leader>. :tabnew<CR>

noremap <C-l> gt
noremap <C-h> gT

" Redraw screen
nnoremap <leader>c :nohl<CR>

nnoremap <leader>z :NERDTreeToggle<CR>
" Search for files
nnoremap <leader>f :Files<CR>

"Open terminal
nnoremap <leader>- :term<CR>i
"Close terminal
tnoremap <Esc> <C-\><C-n>
" Fix fzf terminal to work with the rest of the bindings
autocmd BufLeave * if &filetype == "fzf" | call feedkeys("\<C-\>\<C-n>") | endif


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

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif


" Use K to show documentation in preview window.
nnoremap <silent> K :call ShowDocumentation()<CR>

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction
