let mapleader = " "

" Auto install vim-plug
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

Plug 'mrk21/yaml-vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'ludovicchabant/vim-gutentags'
Plug 'junegunn/goyo.vim'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'tpope/vim-fugitive'
Plug 'sodapopcan/vim-twiggy'
Plug 'junegunn/gv.vim'
Plug 'tpope/vim-sensible'
Plug 'jiangmiao/auto-pairs'
Plug 'sheerun/vim-polyglot'
Plug 'trevordmiller/nova-vim'
Plug 'airblade/vim-gitgutter'
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'ryanoasis/vim-devicons'
Plug 'morhetz/gruvbox'
Plug 'HerringtonDarkholme/yats.vim' " TS Syntax
Plug 'ap/vim-css-color'
Plug 'vim-airline/vim-airline'  " make statusline awesome
Plug 'vim-airline/vim-airline-themes'  " themes for statusline
Plug '~/.fzf'
Plug 'junegunn/fzf.vim'
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() } }
Plug 'w0rp/ale'

" Initialize plugin system
call plug#end()

" Vim Native "

" Some basics:
	set nocompatible
	syntax on
	filetype indent on
	set encoding=utf-8
	set number relativenumber
	set listchars=tab:>-,nbsp:_,trail:.
    set termguicolors
    set autoindent
    nnoremap ; :
    inoremap jk <ESC>
    " escape from terminal mode
    tnoremap <esc> <c-\><c-n>:quit<CR>
    " Set 100 char line bound
    set colorcolumn=100
    highlight ColorColumn ctermbg=7
    set mouse=n
    set nobackup
    set nowritebackup
    set noswapfile

" Theme
    set termguicolors
    set background=dark
    colorscheme gruvbox

" Indentation
    set tabstop=4
    set softtabstop=4
    set shiftwidth=4
    set expandtab
    set smarttab
    set cindent

" Enable auto-completion
	set wildmode=longest,list,full

" Spellcheck
	map <leader>o :setlocal spell! spelllang=en_us<CR>

" Split
	set splitbelow splitright
	map <C-h> <C-w>h
	map <C-j> <C-w>j
	map <C-k> <C-w>k
	map <C-l> <C-w>l
    " Split a terminal in vim
    nnoremap <C-w>t :split<bar>:terminal<CR>a

" Search
    nnoremap S :%s///g<Left><Left><Left>
    set incsearch
    set ignorecase
    set smartcase

" Copy Paste
	vnoremap <C-c> "*Y :let @+=@*<CR>
	map <leader>p "+P

" Auto-delete trailing whitespaces
	autocmd BufWritePre * %s/\s\+$//e


" Plugin Config "

" Goyo plugin makes text more readable when writing prose
	map <leader>g :Goyo \| set linebreak<CR>

nnoremap <leader>d "=strftime("%a, %d %b %Y %H:%M:%S %z")<CR>P
inoremap <C-d> <C-R>=strftime("%a, %d %b %Y %H:%M:%S %z")<CR>

"NerdTree config

let g:NERDTreeWinSize=40
nmap <C-n> :NERDTreeToggle<CR>
let g:NERDTreeGitStatusWithFlags = 1
let g:NERDTreeIgnore = ['^node_modules$']

" Airline config
let g:airline_powerline_fonts = 1
let g:airline_section_y = ""
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#ale#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1

" Coc config

    let g:coc_global_extensions = [
      \ 'coc-snippets',
      \ 'coc-pairs',
      \ 'coc-tsserver',
      \ 'coc-eslint',
      \ 'coc-prettier',
      \ 'coc-json',
      \ 'coc-python',
      \ ]
    " from readme
    " if hidden is not set, TextEdit might fail.
    set hidden " Some servers have issues with backup files, see #649 set nobackup set nowritebackup " Better display for messages set cmdheight=2 " You will have bad experience for diagnostic messages when it's default 4000.
    set updatetime=300

    " don't give |ins-completion-menu| messages.
    set shortmess+=c

    " always show signcolumns
    set signcolumn=yes

    " Use tab for trigger completion with characters ahead and navigate.
    " Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
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
    inoremap <silent><expr> <c-space> coc#refresh()

    " Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
    " Coc only does snippet and additional edit on confirm.
    inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
    " Or use `complete_info` if your vim support it, like:
    " inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"

    " Use `[g` and `]g` to navigate diagnostics
    nmap <silent> [g <Plug>(coc-diagnostic-prev)
    nmap <silent> ]g <Plug>(coc-diagnostic-next)

    " Remap keys for gotos
    nmap <silent> gd <Plug>(coc-definition)
    nmap <silent> gy <Plug>(coc-type-definition)
    nmap <silent> gi <Plug>(coc-implementation)
    nmap <silent> gr <Plug>(coc-references)

    " Use K to show documentation in preview window
    nnoremap <silent> K :call <SID>show_documentation()<CR>

    function! s:show_documentation()
      if (index(['vim','help'], &filetype) >= 0)
        execute 'h '.expand('<cword>')
      else
        call CocAction('doHover')
      endif
    endfunction

    " Highlight symbol under cursor on CursorHold
    autocmd CursorHold * silent call CocActionAsync('highlight')

    " Remap for rename current word
    nmap <F2> <Plug>(coc-rename)

    " Remap for format selected region
    xmap <leader>f  <Plug>(coc-format-selected)
    nmap <leader>f  <Plug>(coc-format-selected)

    augroup mygroup
      autocmd!
      " Setup formatexpr specified filetype(s).
      autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
      " Update signature help on jump placeholder
      autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
    augroup end

    " Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
    xmap <leader>a  <Plug>(coc-codeaction-selected)
    nmap <leader>a  <Plug>(coc-codeaction-selected)

    " Remap for do codeAction of current line
    nmap <leader>ac  <Plug>(coc-codeaction)
    " Fix autofix problem of current line
    nmap <leader>qf  <Plug>(coc-fix-current)

    " Create mappings for function text object, requires document symbols feature of languageserver.
    xmap if <Plug>(coc-funcobj-i)
    xmap af <Plug>(coc-funcobj-a)
    omap if <Plug>(coc-funcobj-i)
    omap af <Plug>(coc-funcobj-a)

    " Use <C-d> for select selections ranges, needs server support, like: coc-tsserver, coc-python
    nmap <silent> <C-d> <Plug>(coc-range-select)
    xmap <silent> <C-d> <Plug>(coc-range-select)

    " Use `:Format` to format current buffer
    command! -nargs=0 Format :call CocAction('format')

    " Use `:Fold` to fold current buffer
    command! -nargs=? Fold :call     CocAction('fold', <f-args>)

    " use `:OR` for organize import of current buffer
    command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

    " Add status line support, for integration with other plugin, checkout `:h coc-status`
    set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

    " Using CocList
    " Show all diagnostics
    nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
    " Manage extensions
    nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
    " Show commands
    nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
    " Find symbol of current document
    nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
    " Search workspace symbols
    nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
    " Do default action for next item.
    nnoremap <silent> <space>j  :<C-u>CocNext<CR>
    " Do default action for previous item.
    nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
    " Resume latest coc list
    nnoremap <silent> <space>p  :<C-u>CocListResume<CR>

" FZF config

    nnoremap <C-p> :Files<Cr>
    nnoremap <Leader>r :Rg<Cr>
    nnoremap <Leader>g :Files ~/<CR>
    nnoremap <Leader>b :Buffers<CR>
    nnoremap <Leader>h :History<CR>
    nnoremap <Leader>t :BTags<CR>
    nnoremap <Leader>T :Tags<CR>
    nnoremap <Leader>a :Ag<Space>

" Markdown preview

    nmap <Leader>m <Plug>MarkdownPreviewToggle

" ALE

    let g:ale_list_window_size = 4
    let g:ale_sign_column_always = 0
    " let g:ale_open_list = 1

    let g:ale_sign_error = '‼'
    let g:ale_sign_warning = '∙'
    let g:ale_lint_on_text_changed = 'never'
    let g:ale_lint_on_enter = '0'
    let g:ale_fixers = {
    \   'javascript': [
    \       'eslint'
    \   ]
    \}
    " Automatic fix on save
    let g:ale_fix_on_save = 1
    nmap <silent> [c <Plug>(ale_previous_wrap)
    nmap <silent> ]c <Plug>(ale_next_wrap)

" Git Gutter


    " Jump between hunks
    nmap <Leader>gn <Plug>GitGutterNextHunk  " git next
    nmap <Leader>gp <Plug>GitGutterPrevHunk  " git previous

    " Use fontawesome icons as signs
    let g:gitgutter_sign_added = '+'
    let g:gitgutter_sign_modified = '>'
    let g:gitgutter_sign_removed = '-'
    let g:gitgutter_sign_removed_first_line = '^'
    let g:gitgutter_sign_modified_removed = '<'
    let g:gitgutter_override_sign_column_highlight = 1
    highlight SignColumn guibg=bg
    highlight SignColumn ctermbg=bg

" Fugitive
    nnoremap <Leader>gs :Gstatus<CR>
    nnoremap <Leader>gd :Gdiff<CR>
    nnoremap <Leader>gb :Gblame<CR>
    nnoremap <Leader>gL :exe ':!cd ' . expand('%:p:h') . '; git la'<CR>
    nnoremap <Leader>gl :exe ':!cd ' . expand('%:p:h') . '; git las'<CR>

" CTags

    set tags=./tags,tags,~/projects/tags;

" YAML
au! BufNewFile,BufReadPost *.{yaml,yml} set filetype=yaml
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
