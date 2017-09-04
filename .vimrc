set nocompatible

syntax enable
filetype plugin on

if has('win32') || has('win64')
    let g:python_host_prog  = 'C:\Python27\python.exe'
    let g:python3_host_prog = 'C:\Python36\python.exe'
    call plug#begin('~/nvim/plugged')
    Plug '~/nvim/plugged/omnisharp-vim'
    Plug 'PProvost/vim-ps1'
else
    call plug#begin('~/.config/nvim/plugged')
endif 

Plug 'slashmili/alchemist.vim'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-dispatch'
Plug 'justinmk/vim-sneak'
Plug 'nightsense/vim-crunchbang'
Plug 'vim-syntastic/syntastic'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'Shougo/neosnippet' | Plug 'Shougo/neosnippet-snippets'
Plug 'bronson/vim-visual-star-search'
call plug#end()

set path+=**
set wildmenu
set wildignore=*.o,*.obj,*~ "stuff to ignore when tab completing
set wildignore+=*DS_Store*
set wildignore+=log/**
set wildignore+=tmp/**
set wildignore+=*.png,*.jpg,*.gif
set wildignore+=*.so,*.swp,*.zip,*/.Trash/**,*.pdf,*.dmg

set backspace=indent,eol

set number
set history=1000
set hidden " Allow switching modified buffers

" search
set hlsearch
set incsearch
nnoremap <silent> <C-l> :<C-u>nohlsearch<CR><C-l>
autocmd FileType erlang setlocal sw=4 ts=4 sts=4 noexpandtab
autocmd FileType ps1 setlocal sw=4 ts=4 sts=4 noexpandtab
autocmd FileType cs setlocal sw=4 ts=4 sts=4 expandtab
autocmd FileType javascript setlocal sw=2 ts=2 sts=2 expandtab

let mapleader=" " 
nnoremap <silent> <Leader><Tab> :<C-u>:bnext<CR>

set guioptions-=m  "remove menu bar
set guioptions-=T  "remove toolbar
set guioptions-=r  "remove right-hand scroll 

" comment
nmap <Leader>;; gcc
xmap <Leader>;; gcc

set laststatus=2 " Vim-airline setting. Always show a status line
" let g:airline_solarized_bg='dark'
let g:airline_theme='dark'

" Enable the list of buffers
let g:airline#extensions#tabline#enabled = 1
" Enable powerline fonts
let g:airline_powerline_fonts = 1
" Show just the filename
let g:airline#extensions#tabline#fnamemod = ':t'

" Don't show the intro
set shortmess+=I

" Turn on the mouse in all modes
set mouse=a

" Always splits to the right and below
set splitright
set splitbelow

" Don't show matching brackets
set noshowmatch

" Show incomplete commands
set showcmd

" w!!: Writes using sudo
cnoremap w!! w !sudo tee % >/dev/null

" CtrlP options
if executable('pt')
  let g:ctrlp_user_command = 'pt %s -l --nocolor -g ""'
elseif has('win32')
  let g:ctrlp_user_command = 'dir %s /-n /b /s /a-d | findstr /v /l ".jpg \\tmp\\ .obj .dll .exe .pdf .zip"'
else
  let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard', 'find %s -type f'] " ignore files in .gitignore
endif
let g:ctrlp_custom_ignore = {
\ 'dir': '\v[\/]\.(git|hg|svn)$',
\ 'file': '\v\.(exe|so|dll)$',
\ }
let g:ctrlp_by_filename = 1
let g:ctrlp_working_path_mode = 'ar'

" Close file w/o closing the buffer
nnoremap <Leader>bd :bn<bar>bd #<CR>

" netrw
let g:netrw_browsex_viewer="xdg-open"
let g:netrw_altv=1

" Colors
colorscheme crunchbang

nnoremap <C-J> a<CR><Esc>k$ " C-J to enter new line w/o entering insert mode.

let g:deoplete#enable_at_startup = 1

augroup omnisharp_commands
    let g:OmniSharp_server_type='roslyn'
    " let g:Omnisharp_start_server=1
augroup END

" Windows shortcuts
nnoremap <Leader>ws <C-w>s
nnoremap <Leader>wv <C-w>v
nnoremap <Leader>ww <C-w>w

nnoremap <Leader>wl <C-w>l
nnoremap <Leader>wh <C-w>h
nnoremap <Leader>wj <C-w>j
nnoremap <Leader>wk <C-w>k

nnoremap <Leader>wc <C-w>c
nnoremap <Leader>wo <C-w>o
nnoremap <Leader>wT <C-w>T

nnoremap & :&&<CR>
xnoremap & :&&<CR>
