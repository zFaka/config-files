set pastetoggle=<F5> " ----- Enable/Disable autoformating asfter paste"
set noequalalways " -------- THis prevent NERDTree resize terminal"
set noswapfile " ----------- Dont make a swap file"
set autoindent " ----------- Indent a line spaces"
set smartindent " ---------- Indent reacting to syntax"
set smartcase " ------------ Case-Insensitive search"
set softtabstop=4 " -------- Default tab stop size"
set tabstop=4 " ------------ Width of tabs"
set shiftwidth=4 " --------- Width of shift"
set expandtab " ------------ Use spaces instead tab"
set nowrap " --------------- Display just one line instead of various lines"
set undodir=~/.vim/undodir " Dir to your Logs modifications"
set undofile " ------------- Create a file to store your log modifications"
set incsearch " ------------ Highlight matches as you type"
set hidden " --------------- Handle multiple buffers better."
set nobackup " ------------- Dont make backup before overwriting a file"
set nowritebackup " -------- And again"
set splitright
set splitbelow
" in TERMINAL open new split panes to right and below
set splitright
set splitbelow
" Languages Highlighting
set nocompatible
set encoding=utf-8
" Enable theming support
if (has("termguicolors"))
    set termguicolors
endif

call plug#begin("~/.vim/plugged")

"terminalsplitting"
Plug 'vimlab/split-term.vim'

"FIle tree"
Plug 'preservim/nerdtree'

" Commenter
Plug 'preservim/nerdcommenter'

" Theme
Plug 'sainnhe/gruvbox-material'

" Barra de estado
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Git
Plug 'tpope/vim-fugitive'

" Language Client
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" TypeScript Highlighting
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'

" File Search
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" Languages Highlighting
Plug 'sheerun/vim-polyglot'

"Plug 'pangloss/vim-javascript'
"Plug 'leafgarland/typescript-vim'
"Plug 'peitalin/vim-jsx-typescript'
"Plug 'styled-components/vim-styled-components', { 'branch': 'main' }
"Plug 'jparise/vim-graphql'

call plug#end()

"""""""""""""""""""""""""""""""""""""""""
"########################################
"############### CONFIG #################
"########################################
"""""""""""""""""""""""""""""""""""""""""
"Coc extensions"
let g:coc_global_extensions = [
            \ 'coc-actions',
            \ 'coc-html', 
            \ 'coc-css', 
            \ 'coc-tsserver',
            \ 'coc-vimlsp',
            \ 'coc-sql',
            \ 'coc-tabnine',
            \ 'coc-snippets',
            \ 'coc-json',
            \ 'coc-jest', 
            \ 'coc-yaml',
            \ 'coc-eslint', 
            \ 'coc-prettier',
            \ 'coc-tslint',
            \ 'coc-explorer',
            \ 'coc-git',
            \ 'coc-marketplace']

"Config Background color basedoff the time"
"Change theme depending on the time of day dark/light
let hr = (strftime('%H'))
if hr >= 20
    set background=dark
    let g:gruvbox_material_transparent_background = 0
    let g:gruvbox_material_background = 'hard'
elseif hr >= 19
    set background=dark
    let g:gruvbox_material_transparent_background = 0
    let g:gruvbox_material_background = 'medium'
elseif hr >= 6
    set background=dark
    let g:gruvbox_material_transparent_background = 0
    let g:gruvbox_material_background = 'soft'
endif

filetype plugin on

"theme"
let g:airline_theme='papercolor'

" Theme
syntax enable
colorscheme gruvbox-material

" start terminal in insert mode
au BufEnter * if &buftype == 'terminal' | :startinsert | endif

" open terminal on ctrl+n;
" uses zsh instead of bash
function! OpenTerminal()
    vsplit term://zsh
    vertical resize 50
endfunction
nnoremap <c-n> :call OpenTerminal()<CR>
nnoremap <c-x> :19Term<CR>
"split term:zsh"
""resize 13

""To simulate i_CTRL-R in terminal-mode:
:tnoremap <expr> <C-R> '<C-\><C-N>"'.nr2char(getchar()).'pi'

""To use ALT+{h,j,k,l} to navigate windows from any mode:
:tnoremap <A-h> <C-\><C-N><C-w>h
:tnoremap <A-j> <C-\><C-N><C-w>j
:tnoremap <A-k> <C-\><C-N><C-w>k
:tnoremap <A-l> <C-\><C-N><C-w>l
:inoremap <A-h> <C-\><C-N><C-w>h
:inoremap <A-j> <C-\><C-N><C-w>j
:inoremap <A-k> <C-\><C-N><C-w>k
:inoremap <A-l> <C-\><C-N><C-w>l
:nnoremap <A-h> <C-w>h
:nnoremap <A-j> <C-w>j
:nnoremap <A-k> <C-w>k
:nnoremap <A-l> <C-w>l

""NERDTree
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
let NERDTreeQuitOnOpen=1

""""""""""""""""""""""""""""""""""""""""
"######################################"
"############# KEYMAPING ###############
"######################################"
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
map ff gg=G<C-o><C-o>

" Escape"
inoremap jj <ESC>

" Put a semiclon at the end of the line"
nnoremap mm A;<Esc>

" resize term"
nnoremap <C-=> :vertical res +17<CR>

"Keep wrinting after script on bracket";
inoremap kk <Esc>la

"# React Shortcut"
nnoremap tr iimport React from 'react';<CR>
            \<CR><Esc>
            \iexport const <Char-127> = (<Char-127>) => {<CR>return (<CR>)}<Esc>ko<tab><><CR></><Esc>ko<tab><Char-127><Esc>
            \/<Char-127><CR>ciw
"\import PropTypes from 'prop-types';<CR>
"\<Char-127>.propTypes = {<CR>}<Esc>ko<tab><Char-127><Esc>ja<CR>

"# React Shortcut"
nnoremap tt idescribe(' <Char-127> ', () => {<CR><CR><CR>}<Esc>ko<tab>
            \test('<Char-127>', () => {<CR>}<ESC>ko<CR><CR><Char-127><Esc>
            \/<Char-127><CR>ciw
"half arrow callback"
inoremap >> () => {<CR><CR>}<Esc>ko<tab>

"const "
inoremap cc const <Char-127> = <Char-127>;<Esc>/<Char-127><CR>ciw

"change inside word"
nnoremap q xi

"Import"
inoremap ipf import <Char-127> from '<Char-127>';<Esc>/<Char-127><CR>ciw
inoremap ips import <Char-127> ;<Esc>/<Char-127><CR>ciw

" ${}"
inoremap <Char-36><Char-36> <Char-36>{}<Esc>i

"Jump to line number"
nnoremap <CR> G

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

"# Git"
nnoremap <Leader>f :GFiles<CR>
nnoremap <Leader>gs :Gstatus<CR>
nnoremap <Leader>ga :Git add .<CR>
nnoremap <Leader>gc :Gcommit -m ""<left>
nnoremap <Leader>gp :Gpush<CR>
nnoremap <Leader>gl :Gpull

"# coc.nvim"
" GoTo s
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-impementation)
nmap <silent> gr <Plug>(coc-references)

" Remap keys for applying codeAction to the current line.
nmap <leader>do <Plug>(coc-codeaction)

" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

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
"tnoremap <Esc> <C-\><C-n>
tnoremap jj <C-\><C-n>

"NERDTreeToggle"
nmap fe :NERDTreeToggle<CR>
