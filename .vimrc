set nocompatible

syntax enable
filetype plugin on

set path+=**
set wildmenu
set backspace=indent,eol

set number
set history=1000
set hidden " Allow switching modified buffers

" search
set hlsearch
set incsearch
nnoremap <silent> <C-l> :<C-u>nohlsearch<CR><C-l>
autocmd FileType erlang setlocal sw=4 ts=4 sts=4 noexpandtab

let mapleader=" " 
nnoremap <silent> <Leader><Tab> :<C-u>:bnext<CR>

set guioptions-=m  "remove menu bar
set guioptions-=T  "remove toolbar
set guioptions-=r  "remove right-hand scroll 

" comment
nmap <Leader>;; gcc
xmap <Leader>;; gcc

set laststatus=2 " Vim-airline setting. Always show a status line
let g:airline_theme='solarized'
" Enable the list of buffers
let g:airline#extensions#tabline#enabled = 1

" Show just the filename
let g:airline#extensions#tabline#fnamemod = ':t'

" Don't show the intro
set shortmess+=I

" Turn on the mouse in all modes
set mouse=a

" Always splits to the right and below
set splitright
set splitbelow
