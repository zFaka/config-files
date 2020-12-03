set pastetoggle=<F5>
set noswapfile
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
set bg=light
set hidden
set nobackup
set nowritebackup

" Enable theming support
if (has("termguicolors"))
    set termguicolors
endif

" Terminal
" open new split panes to right and below
set splitright
set splitbelow

" Languages Highlighting
set nocompatible
set encoding=utf-8

filetype plugin on

call plug#begin("~/.vim/plugged")

" Commenter
Plug 'preservim/nerdcommenter'

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

" File Search
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" Languages Highlighting
Plug 'sheerun/vim-polyglot'

"Plug 'leafgarland/typescript-vim'
"Plug 'peitalin/vim-jsx-typescript'

call plug#end()

" Theme
syntax enable
let g:gruvbox_material_background = 'soft'
let g:airline_theme = 'gruvbox_material'
let g:gruvbox_material_transparent_background = 1
colorscheme gruvbox-material

" start terminal in insert mode
au BufEnter * if &buftype == 'terminal' | :startinsert | endif

" open terminal on ctrl+;
" uses zsh instead of bash
function! OpenTerminal()
    split term://zsh
    resize 10
endfunction
nnoremap <c-n> :call OpenTerminal()<CR>

""""""""""""""""""""""""""""""""""""""""
"############# KEYMAPING ###############
""""""""""""""""""""""""""""""""""""""""
" Set Leader
let mapleader = " "

" Save
nnoremap <Leader>w :w<CR>

" Quit"
nnoremap <Leader>q :q<CR>

" Space after comma"
inoremap , ,<space>

" Autoindent"
map <F2> gg=G<C-o><C-o>

" Escape"
inoremap jj <ESC>

" Put a semiclon at the end of the line"
nnoremap m A;<Esc><CR>i

"Automatically closing braces
inoremap {<CR> {<CR>}<Esc>ko<tab>
inoremap <Char-61><Char-62><Space>{ {<CR>}<Esc>ko<tab>
inoremap [ [<CR>]<Esc>ko<tab>
inoremap ( (<CR>)<Esc>ko<tab>

"Normal brackets
inoremap ) ()<Esc>i
inoremap ] []<Esc>i
inoremap } {}<Esc>i

"Automatically close comillas
inoremap ` ``<Esc>i
inoremap <Char-36> <Char-36>{}<Esc>i
inoremap ' ''<Esc>i
inoremap " ""<Esc>i

"# Git"
nnoremap <Leader>G :G<CR>
nnoremap <Leader>gs :Gstatus<CR>
nnoremap <Leader>ga :Git add .<CR>
nnoremap <Leader>gc :Gcommit -m ""<left>
nnoremap <Leader>gp :Gpush -u origin master<CR>
nnoremap <Leader>gl :Gpull

"# coc.nvim"
" GoTo s
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-impementation)
nmap <silent> gr <Plug>(coc-references)

"Completion with Enter"
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

"TAB completition"
inoremap <silent><expr> <TAB>
            \ pumvisible() ? "\<C-n>" :
            \ <SID>check_back_space() ? "\<TAB>" :
            \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" fzf"
nnoremap <C-p> :FZF<CR>

" turn terminal to normal mode with escape
tnoremap <Esc> <C-\><C-n>
