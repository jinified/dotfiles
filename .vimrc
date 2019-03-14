if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Plugins "

call plug#begin('~/.vim/plugged')

Plug 'tpope/vim-surround'
Plug 'ap/vim-css-color'
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-commentary'  "comment-out by gc
Plug 'airblade/vim-gitgutter'  " show git changes to files in gutter
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'  "to highlight files in nerdtree
Plug 'vim-airline/vim-airline'  " make statusline awesome
Plug 'vim-airline/vim-airline-themes'  " themes for statusline 
Plug 'scrooloose/nerdtree'  " file list
Plug 'majutsushi/tagbar'  " show tags in a bar (functions etc) for easy browsing
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-sensible'
Plug 'Shougo/neco-syntax'
Plug 'davidhalter/jedi-vim'   " jedi for python
Plug '~/.fzf'
Plug 'junegunn/fzf.vim'
Plug 'w0rp/ale'
Plug 'junegunn/seoul256.vim'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
Plug 'roxma/nvim-yarp'
Plug 'ncm2/ncm2'
Plug 'ncm2/ncm2-jedi'
" Words in buffer completion
Plug 'ncm2/ncm2-bufword'
" Filepath completion
Plug 'ncm2/ncm2-path'
Plug 'ncm2/ncm2-tmux'
Plug 'ncm2/ncm2-syntax'
Plug 'ncm2/ncm2-tern'
Plug 'ncm2/ncm2-pyclang'
Plug 'ncm2/ncm2-ultisnips'
Plug 'SirVer/ultisnips'

call plug#end()

" Airline
let g:airline_powerline_fonts = 1
let g:airline_section_y = ""
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#ale#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1

" Ncm

autocmd BufEnter * call ncm2#enable_for_buffer()
set completeopt=menuone,noselect,noinsert
set shortmess+=c
inoremap <c-c> <ESC>
" make it fast
let ncm2#popup_delay = 5
let ncm2#complete_length = [[1, 1]]
" Use new fuzzy based matches
let g:ncm2#matcher = 'substrfuzzy'
" Press enter key to trigger snippet expansion
" The parameters are the same as `:help feedkeys()`
inoremap <silent> <expr> <CR> ncm2_ultisnips#expand_or("\<CR>", 'n')

" Jedi-vim

let g:jedi#auto_initialization = 1
let g:jedi#completions_enabled = 0
let g:jedi#auto_vim_configuration = 0
let g:jedi#smart_auto_mappings = 0
let g:jedi#popup_on_dot = 0
let g:jedi#completions_command = ""
let g:jedi#show_call_signatures = "1"
let g:jedi#show_call_signatures_delay = 0
let g:jedi#use_tabs_not_buffers = 0
let g:jedi#show_call_signatures_modes = 'i'  " ni = also in normal mode
let g:jedi#enable_speed_debugging=0

" ALE

let g:ale_python_flake8_options = '--ignore=E129,E501,E302,E265,E241,E305,E402,W503'
let g:ale_python_pylint_options = '-j 0 --max-line-length=120'
let g:ale_list_window_size = 4
let g:ale_sign_column_always = 0
" let g:ale_open_list = 1

let g:ale_sign_error = '‼'
let g:ale_sign_warning = '∙'
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_enter = '0'
" Automatic fix on save
let g:ale_fix_on_save = 1
" Fix Python files with autopep8 and yapf.
let b:ale_fixers = ['black']

" Python path declaration

let g:python3_host_prog = '/usr/bin/python3'
let g:python_host_prog = '/usr/bin/python2'

"=== General ==="

syntax on
filetype indent on
set fileformat=unix
set encoding=UTF-8
set incsearch
set autoindent
set cindent
set showmatch
set relativenumber
set backspace=indent,eol,start
set list
set listchars=tab:>-,nbsp:_,trail:.
set pastetoggle=<F2>
set updatetime=100
set smartcase

set history=1000  " remember more commands and search history

"=== Display ==="

set t_Co=256
colorscheme seoul256
" Set 100 char line bound
set colorcolumn=100
highlight ColorColumn ctermbg=7

"=== Mapping ==="

let mapleader = "\<Space>"

" Esc
imap <F13> <Esc>
cnoremap <Esc> <C-c>
inoremap <c-c> <ESC>
nnoremap <C-z> <Esc>

" Tabs

nnoremap tn :tabnew<Space>
nnoremap tk :tabnext<CR>
nnoremap tj :tabprev<CR>
nnoremap th :tabfirst<CR>
nnoremap tl :tablast<CR>

nnoremap ; :
nnoremap gcp "*p
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
" NERDTree
map <C-n> :NERDTreeToggle<CR>
" Tagbar
map <C-t> :set nosplitright<CR>:TagbarToggle<CR>:set splitright<CR>
" FZF
nnoremap <C-p> :Files<Cr>
nnoremap <C-g> :Rg<Cr>
nnoremap <Leader>b :Buffers<CR>
nnoremap <Leader>h :History<CR>
nnoremap <Leader>t :BTags<CR>
nnoremap <Leader>T :Tags<CR>
nnoremap <Leader>a :Ag<Space>


"=== Indentation ==="

set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab

"=== Split ==="

set splitbelow
set splitright
