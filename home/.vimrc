"
" Alex Mikhalev's nice vimrc
" 

scriptencoding utf-8
" NeoBundle {{{
set nocompatible	" Puts the im in VIm
filetype off

" Initialize NeoBundle
set rtp+=~/.vim/bundle/neobundle.vim
call neobundle#begin(expand('~/.vim/bundle/'))

NeoBundleFetch 'Shougo/neobundle.vim'

" Place all 'NeoBundle's here
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'sjl/gundo.vim'
NeoBundle 'rking/ag.vim'
NeoBundle 'bling/vim-airline'
NeoBundle 'edkolev/tmuxline.vim'

NeoBundle 'tpope/vim-commentary'
NeoBundle 'tpope/vim-dispatch'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'tpope/vim-surround'
NeoBundle 'tpope/vim-repeat'
NeoBundle 'tpope/vim-projectionist'

NeoBundle 'scrooloose/syntastic'
NeoBundle 'syngan/vim-vimlint'
NeoBundle 'syngan/vim-vimlparser'
NeoBundle 'MarcWeber/vim-addon-mw-utils'
NeoBundle 'tomtom/tlib_vim'
NeoBundle 'kien/ctrlp.vim'
NeoBundle 'Yggdroot/indentLine'
NeoBundle 'Raimondi/delimitMate'
NeoBundle 'Lokaltog/vim-easymotion'
NeoBundle 'godlygeek/tabular'
NeoBundle 'tfnico/vim-gradle'
NeoBundle 'majutsushi/tagbar'
NeoBundle 'edkolev/promptline.vim'
NeoBundle 'lukerandall/haskellmode-vim'
NeoBundle 'rust-lang/rust.vim'

" NeoBundle 'phildawes/racer', {
"             \   'build' : {
"             \     'mac': 'cargo build --release',
"             \     'unix': 'cargo build --release',
"             \   }
"             \ }
NeoBundle 'Valloric/YouCompleteMe', {
    \ 'build'      : {
        \ 'mac'     : './install.sh --clang-completer --system-libclang --omnisharp-completer',
        \ 'unix'    : './install.sh --clang-completer --system-libclang --omnisharp-completer'
    \ }
\ }

NeoBundle 'vim-scripts/javacomplete'
NeoBundle 'SirVer/ultisnips'
NeoBundle 'honza/vim-snippets'

call neobundle#end()

NeoBundleCheck

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
source ~/.vim/bundle/tabular/after/plugin/TabularMaps.vim

" Tagbar
let g:tagbar_iconchars = ['+', '-']

" Airline
set laststatus=2
let g:airline_powerline_fonts=1
let g:airline_theme='powerlineish'
let g:airline_left_sep=''
let g:airline_right_sep=''
let g:airline_section_z=''
" tab line
let g:airline#extensions#tabline#enabled = 1

" haskellmode
let g:haddock_browser = "/usr/bin/chromium"

" eclim
let g:EclimCompletionMethod = 'omnifunc'

" }}}
" Misc. {{{
set encoding=utf-8
filetype plugin indent on

set hidden
" }}}
" UI {{{
set guifont=Inconsolata\ for\ Powerline:h15
set t_Co=256
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
map <leader>pi      :PluginInstall<CR>
map <leader>pu      :PluginInstall!<CR>
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
