set pastetoggle=<F3>
set noswapfile
set nobackup
set autoindent
set smartindent
set smartcase
set tabstop=4 
set softtabstop=4
set shiftwidth=4
set expandtab
set nowrap
set undodir=~/.vim/undodir
set undofile
set incsearch

set hidden
set nobackup
set nowritebackup

call plug#begin("~/.vim/plugged")
" Theme
Plug 'sainnhe/gruvbox-material'

" Barra de estado
Plug 'vim-airline/vim-airline'

" Git
Plug 'tpope/vim-fugitive'

" Language Client
Plug 'neoclide/coc.nvim', {'branch': 'release'}
let g:coc_global_extensions = ['coc-emmet', 'coc-css', 'coc-html', 'coc-json', 'coc-prettier', 'coc-tsserver']
" TypeScript Highlighting
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'


" File Explorer with Icons
Plug 'scrooloose/nerdtree'
Plug 'ryanoasis/vim-devicons'

" File Search
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" Languages Highlighting
Plug 'sheerun/vim-polyglot'

Plug 'pangloss/vim-javascript'
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'
Plug 'styled-components/vim-styled-components', { 'branch': 'main' }
Plug 'jparise/vim-graphql'

call plug#end()

"Coc TAB completition"
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Languages Highlighting
set nocompatible
set encoding=utf-8

" Enable theming support
if (has("termguicolors"))
	set termguicolors
endif

" Theme
syntax enable
set bg=light
let g:gruvbox_material_background = 'soft'
let g:airline_theme = 'gruvbox_material'
let g:gruvbox_material_transparent_background = 1
colorscheme gruvbox-material

let NERDTreeQuitOnOpen=1
let g:NERDTreeShowHidden = 1
let g:NERDTreeMinimalUI = 1
let g:NERDTreeIgnore = []
let g:NERDTreeStatusline = ''
" Automaticaly close nvim if NERDTree is only thing left open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

nmap <C-b> :NERDTreeToggle<CR>

nnoremap <C-p> :FZF<CR>
let g:fzf_action = {
			\ 'ctrl-t': 'tab split',
			\ 'ctrl-s': 'split',
			\ 'ctrl-v': 'vsplit'
			\}
" requires silversearcher-ag
" used to ignore gitignore files
let $FZF_DEFAULT_COMMAND = 'ag -g ""'

" open new split panes to right and below
set splitright
set splitbelow

" turn terminal to normal mode with escape
tnoremap <Esc> <C-\><C-n>

" use alt+hjkl to move between split/vsplit panels
tnoremap <A-h> <C-\><C-n><C-w>h
tnoremap <A-j> <C-\><C-n><C-w>j
tnoremap <A-k> <C-\><C-n><C-w>k
tnoremap <A-l> <C-\><C-n><C-w>l
nnoremap <A-h> <C-w>h
nnoremap <A-j> <C-w>j
nnoremap <A-k> <C-w>k
nnoremap <A-l> <C-w>l

" start terminal in insert mode
au BufEnter * if &buftype == 'terminal' | :startinsert | endif

" open terminal on ctrl+;
" uses zsh instead of bash
function! OpenTerminal()
	split term://zsh
	resize 10
endfunction
nnoremap <c-n> :call OpenTerminal()<CR>

" Autoformat
map <C-m> gg=G<C-o><C-o>
" Esc
inoremap jj <ESC>
"make a space after comma"
inoremap , ,<Space>

"Automatically closing braces
inoremap { {<CR>}<Esc>ko<tab>
inoremap [ [<CR>]<Esc>ko<tab>
inoremap ( (<CR>)<Esc>ko<tab>

"Normal brackets
inoremap ) ()<Esc>i
inoremap ] []<Esc>i
inoremap } {}<Esc>i

"Automatically close comillas
inoremap ` ``<Esc>i
inoremap ' ''<Esc>i
inoremap " ""<Esc>i

" Put a semiclon at the end of the line"
nnoremap m A;<Esc>
