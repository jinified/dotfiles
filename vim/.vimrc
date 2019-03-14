set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-sensible'
Plugin 'scrooloose/syntastic'
Plugin 'kien/ctrlp.vim'
Plugin 'majutsushi/tagbar'
Plugin 'vim-scripts/TeX-9'
Plugin 'tpope/vim-surround'
Plugin 'honza/vim-snippets'
Plugin 'tomtom/tcomment_vim'
Plugin 'ap/vim-buftabline'
Plugin 'itchyny/lightline.vim'
Plugin 'ap/vim-css-color'
Plugin 'Yggdroot/indentLine'
Plugin 'tpope/vim-commentary'
Plugin 'posva/vim-vue'
Plugin 'w0rp/ale'

if has('nvim')
    Plugin 'Shougo/deoplete.nvim'
    Plugin 'zchee/deoplete-jedi'
    Plugin 'carlitux/deoplete-ternjs'
    Plugin 'zchee/deoplete-go'
    let g:deoplete#enable_at_startup = 1

    " deoplete-ternjs

    let g:deoplete#sources#ternjs#types = 1
    let g:deoplete#sources#ternjs#depths = 1
    let g:deoplete#sources#ternjs#docs = 1
    let g:deoplete#sources#ternjs#filter = 0
    let g:deoplete#sources#ternjs#case_insensitive = 1
    let g:deoplete#sources#ternjs#guess = 0

    " Mapping
    inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
    inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
endif



call vundle#end()
filetype plugin indent on

" Syntastic
let g:syntastic_cpp_compiler_options = '-std=c++11 -stdlib=libc++'
let g:syntastic_python_checkers = ['flake8']
let g:syntastic_python_flake8_args = "--max-line-length=100"
let g:syntastic_always_populate_loc_list = 1

" Ctrl-P
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

" Tex-9
let g:tex_flavor = 'latex'
let g:tex_nine_config = {
    \'compiler': 'pdflatex',
    \'viewer': {'app': 'evince', 'target': 'pdf'},
    \'leader': ';',
\}

" Use deoplete.
let g:deoplete#enable_at_startup = 1

" Tagbar
nmap <F8> :TagbarToggle<CR>

" General
syntax on
set incsearch
set autoindent
set cindent
set showmatch
set relativenumber
set backspace=indent,eol,start
set list
set listchars=tab:>-,nbsp:_,trail:.
set pastetoggle=<F2>
let g:indentLine_noConcealCursor=2

" Colors
set t_Co=256
colorscheme xoria256
set colorcolumn=100
highlight ColorColumn ctermbg=7

" Mapping
let mapleader = "\<Space>"
nnoremap <F3> :YcmCompleter GoTo<CR>
nnoremap ; :
nnoremap gcp "*p

" Basic indentation
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab

" Navigation mapping
nnoremap <C-j> <C-W><C-J>
nnoremap <C-k> <C-W><C-K>
nnoremap <C-l> <C-W><C-L>
nnoremap <C-h> <C-W><C-H>

" Fugitive

nnoremap <Leader>gs :Gstatus<CR>
nnoremap <Leader>gd :Gdiff<CR>
nnoremap <Leader>gb :Gblame<CR>
nnoremap <Leader>gL :exe ':!cd ' . expand('%:p:h') . '; git la'<CR>
nnoremap <Leader>gl :exe ':!cd ' . expand('%:p:h') . '; git las'<CR>
nnoremap <Leader>gh :Silent Glog<CR>
nnoremap <Leader>gH :Silent Glog<CR>:set nofoldenable<CR>
nnoremap <Leader>gr :Gread<CR>
nnoremap <Leader>gw :Gwrite<CR>
nnoremap <Leader>gp :Git push<CR>
nnoremap <Leader>g- :Silent Git stash<CR>:e<CR>
nnoremap <Leader>g+ :Silent Git stash pop<CR>:e<CR>

" Split
set splitbelow
set splitright

" YAML
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab

" Vim-vue
let g:vue_disable_pre_processors = 1

" Ale

" Set this variable to 1 to fix files when you save them.
let g:ale_fix_on_save = 1

autocmd FileType latex,tex,md,markdown,text setlocal spell

let g:ctrlp_prompt_mappings = {
    \ 'AcceptSelection("e")': ['<2-LeftMouse>'],
    \ 'AcceptSelection("t")': ['<cr>'],
    \ }
