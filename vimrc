"
" Alex Mikhalev's nice vimrc
" 

" Misc. {{{
scriptencoding utf-8
if has('vim_starting')
    set encoding=utf-8
endif

filetype plugin indent on

set hidden
" }}}
" dein.vim {{{
set nocompatible	" Puts the im in VIm
filetype off

" Initialize dein.vim
set runtimepath+=~/.vim/dein/repos/github.com/Shougo/dein.vim
call dein#begin(expand('~/.vim/dein/')) " Plugin root path

call dein#add('Shougo/dein.vim')

" Place all dien plugins here

call dein#add('sjl/gundo.vim')
call dein#add('rking/ag.vim')
call dein#add('vim-airline/vim-airline')
call dein#add('vim-airline/vim-airline-themes')
" Maitainer needs to merge a PR that fixes an issue status-utf8 in new tmux
" versions. Until then, use a fork
" call dein#add('edkolev/tmuxline.vim')
call dein#add('zeorin/tmuxline.vim', { 'rev': 'utf8-suppress-error'} )

call dein#add('tpope/vim-commentary')
call dein#add('tpope/vim-dispatch')
call dein#add('tpope/vim-fugitive')
call dein#add('tpope/vim-surround')
call dein#add('tpope/vim-repeat')
call dein#add('tpope/vim-projectionist')

call dein#add('scrooloose/syntastic')
call dein#add('syngan/vim-vimlint')
call dein#add('syngan/vim-vimlparser')
call dein#add('Yggdroot/indentLine')
call dein#add('Raimondi/delimitMate')
" call dein#add('Lokaltog/vim-easymotion')
call dein#add('godlygeek/tabular')
call dein#add('tfnico/vim-gradle')
call dein#add('majutsushi/tagbar')
" call dein#add('edkolev/promptline.vim')
call dein#add('lukerandall/haskellmode-vim')
call dein#add('rust-lang/rust.vim')

" call dein#add('phildawes/racer', {
" \   'if' : executable('cargo'),
" \   'build' : 'cargo build --release'
" \ })
" call dein#add('Valloric/YouCompleteMe', {
" \   'build' : 'sh -s "git submodule update --init --recursive && ./install.py"'
" \ })
call dein#add('Shougo/vimproc.vim', {
\   'build' : 'make',
\ })

call dein#add('vim-scripts/javacomplete')
call dein#add('SirVer/ultisnips')
call dein#add('honza/vim-snippets')

call dein#end()

" }}}
" Plugin configs {{{

" NERDTree
let g:NERDTreeDirArrows = 1

" UltiSnips
let g:UltiSnipsExpandTrigger = "<c-j>"
let g:UltiSnipsJumpForwardTrigger = "<c-j>"
let g:UltiSnipsJumpBackwardTrigger = "<c-k>"
let g:UltiSnipsEditSplit = "verticle"

" indentLine
let g:indentLine_char = '│'

" Tabular
"source ~/.vim/bundle/tabular/after/plugin/TabularMaps.vim

" Tagbar
let g:tagbar_iconchars = ['+', '-']

" Airline
"set laststatus=2
let g:airline_powerline_fonts=0
let g:airline_theme='papercolor'
"let g:airline_left_sep=''
"let g:airline_right_sep=''
"let g:airline_section_z=''
" tab line
let g:airline#extensions#tabline#enabled = 1

" haskellmode
let g:haddock_browser = "/usr/bin/chromium"

" eclim
let g:EclimCompletionMethod = 'omnifunc'

" }}}
" UI {{{
set mouse=a
colorscheme desert " Some nice colors

syntax enable      " That nice syntax highlighting

" Indentation
set smarttab
set smartindent
set shiftwidth=4
set tabstop=4      " Visual spaces per tab
set expandtab      " Tab key -> spaces

set number         " Line number
set relativenumber " Relative line numbers

" Better searching
set ignorecase     " Ignore case in search
set incsearch      " Incremental search
set hlsearch       " Highlight search

set lazyredraw     " Performant redraw
set showmatch      " Highlight ({[]}) matches

" Folding
set foldenable
set foldlevelstart=10
set foldnestmax=10
set foldmethod=syntax

" Vim command completion
set wildmenu
set wildmode=list:longest,full

" CtrlP use ag and git
let g:ctrlp_use_caching = 0
if executable('ag')
    set grepprg=ag\ --nogroup\ --nocolor

    let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
else
    let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files . -co --exclude-standard', 'find %s -type f']
    let g:ctrlp_prompt_mappings = {
                \ 'AcceptSelection("e")': ['<space>', '<cr>', '<2-LeftMouse>'],
                \ }
endif

" }}}
" Regular mappings {{{

" Nicer leader
let g:mapleader = "\<space>"

" Better mobility
nnoremap j gj
nnoremap k gk
nnoremap B ^
nnoremap E $

" ESC is so far away...
inoremap  jk       <ESC>

" }}}
" Leader mappings {{{
map <leader>r       :redraw!<CR>
map <leader>o       :CtrlP<CR>
map <leader>w       :w<CR>
map <leader>sv      :so ~/.vimrc<CR>
vmap <leader>y      "+y
vmap <leader>d      "+d
nmap <leader>p      "+p
nmap <leader>P      "+P
vmap <leader>p      "+p
vmap <leader>P      "+P
map <leader><space> :nohlsearch<CR>
map <leader>pi      :call dein#install()<CR>
map <leader>pu      :call dein#update()<CR>
map <leader>pc      :PluginClean<CR>
map <leader>tf      :NERDTreeToggle<CR>
map <leader>tt      :TagbarToggle<CR>
map <leader>tc      :tabnew<CR>
map <leader>tx      :tabclose<CR>
map <leader>tn      :tabnext<CR>
map <leader>tp      :tabprev<CR>
map <leader>bn      :bn<CR>
map <leader>bp      :bp<CR>
map <leader>bs      :buffers<CR>
map <leader>bd      :bd<CR>
map <leader>bb      :buffers<CR>:buffer<Space>
map <leader>dm      :Make<CR>
map <leader>db      :Make!<CR>
map <leader>dd      :Dispatch<CR>
map <leader>ds      :Start<CR>
map <leader>dc      :Copen<CR>
map <leader>ev      :e ~/.vimrc<CR>
map <leader>et      :e ~/.tmux.conf<CR>
map <leader>em      :e ./Makefile<CR>
map <leader>ep      :e ./.projections.json<CR>
map <leader>sc      :wa \| SyntasticCheck \| Errors<CR>
map <leader>se      :Errors<CR>
map <leader>cn      :cnext<CR>
map <leader>cp      :cprevious<CR>
" }}}
" AutoCmds {{{
" Close vim if the last window is NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

" javacomplete
autocmd Filetype java setlocal omnifunc=javacomplete#Complete
autocmd Filetype java setlocal completefunc=javacomplete#CompleteParamsInfo

" haskellmode
autocmd Filetype *.hs compiler ghc

" rust
autocmd Filetype *.rs let b:dispatch="cargo run"

" }}}
" Custom functions {{{
" }}}
