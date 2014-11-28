"
" Alex Mikhalev's nice vimrc
" 

scriptencoding utf-8
" Vundle {{{
set nocompatible	" Puts the im in VIm
filetype off		" Required for Vundle

" Initialize Vundle
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Place all 'Plugin's here
Plugin 'scrooloose/nerdtree'
Plugin 'sjl/gundo.vim'
Plugin 'fholgado/minibufexpl.vim'
Plugin 'rking/ag.vim'

Plugin 'tpope/vim-commentary'
Plugin 'scrooloose/syntastic'
Plugin 'syngan/vim-vimlint'
Plugin 'syngan/vim-vimlparser'
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'kien/ctrlp.vim'
Plugin 'Yggdroot/indentLine'
Plugin 'Raimondi/delimitMate'

Plugin 'Valloric/YouCompleteMe'
Plugin 'vim-scripts/javacomplete'
Plugin 'garbas/vim-snipmate'
Plugin 'honza/vim-snippets'

call vundle#end()

" }}}
" Plugin configs {{{

" NERDTree
let g:NERDTreeDirArrows = 0

" UltiSnips
" let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsEditSplit = "verticle"

" indentLine
let g:indentLine_char = '│'

" }}}
" Misc. {{{
set encoding=utf-8
filetype plugin indent on

set hidden
" }}}
" UI {{{
colorscheme desert	" Some nice colors

syntax enable		" That nice syntax highlighting

" Indentation
set tabstop=4		" Visual spaces per tab
set softtabstop=4	" Text spaces per tab
set expandtab		" Tab key -> spaces

set relativenumber	" Relative line numbers 

" Better searching
set ignorecase		" Ignore case in search
set incsearch		" Incremental search
set hlsearch		" Highlight search

set wildmenu        " Vim command completion
set lazyredraw      " Performant redraw
set showmatch       " Highlight ({[]}) matches

" Folding
set foldenable
set foldlevelstart=10
set foldnestmax=10
set foldmethod=syntax

" Vim command completion
set wildmenu

" }}}
" Regular mappings {{{

" Nicer leader
let g:mapleader = ','

" Better mobility
nnoremap    j               gj
nnoremap    k               gk
nnoremap    B               ^
nnoremap    E               $

" ESC is so far away...
inoremap    jk              <ESC>   

nmap    <space>             za
" }}}
" Leader mappings {{{
map     <leader>r           :redraw!<CR>
map     <leader>sv          :so ~/.vimrc<CR>
map     <leader><space>     :nohlsearch<CR>
map     <leader>pi          :PluginInstall<CR>
map     <leader>pu          :PluginInstall!<CR>
map     <leader>pc          :PluginClean<CR>
map     <leader>tn          :NERDTreeToggle<CR>
map     <leader>tb          :MBEToggle<CR>
map     <leader>mm          :wa \| silent make \| redraw! \| cw<CR>
map     <leader>mr          :make run \| redraw!<CR>
map     <leader>mc          :make clean \| redraw!<CR>
map     <leader>ev          :e ~/.vimrc<CR>
map     <leader>et          :e ~/.tmux.conf<CR>
map     <leader>em          :e ./Makefil<CR>
map     <leader>sc          :wa \| SyntasticCheck \| Errors<CR>
map     <leader>cn          :cnext<CR>
map     <leader>cp          :cprevious<CR>
" }}}
" AutoCmds {{{
" Open NERDTree on start
" autocmd vimenter * :NERDTree

" Close vim if the last window is NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

" javacomplete
autocmd Filetype java setlocal omnifunc=javacomplete#Complete
autocmd Filetype java setlocal completefunc=javacomplete#CompleteParamsInfo

" }}}
" Custom functions {{{
" }}}
