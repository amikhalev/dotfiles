"
" Alex Mikhalev's nice vimrc
" 

" Misc. {{{
scriptencoding utf-8
if has('vim_starting')
    set encoding=utf-8
endif

set hidden
" }}}
" dein.vim {{{

" Initialize vim-plug
call plug#begin('~/.vim/plugged')

" Place all plugins here

" Plug ('sjl/gundo.vim')
" Plug ('rking/ag.vim')
Plug ('vim-airline/vim-airline')
Plug ('vim-airline/vim-airline-themes')

Plug ('tpope/vim-commentary')
Plug ('tpope/vim-dispatch')
Plug ('tpope/vim-fugitive')
Plug ('tpope/vim-surround')
Plug ('tpope/vim-repeat')
" Plug ('tpope/vim-projectionist')
Plug ('tpope/vim-eunuch')

" Plug ('scrooloose/syntastic')
" Plug ('syngan/vim-vimlint')
" Plug ('syngan/vim-vimlparser')
" Plug ('Yggdroot/indentLine')
" Plug ('Raimondi/delimitMate')
" Plug ('Lokaltog/vim-easymotion')
" Plug ('godlygeek/tabular')
" Plug ('majutsushi/tagbar')
" Plug ('edkolev/promptline.vim')
" Plug ('lukerandall/haskellmode-vim')
" Plug ('radenling/vim-dispatch-neovim')

" Plug ('phildawes/racer', {
" \   'if' : executable('cargo'),
" \   'build' : 'cargo build --release'
" \ })
" Plug ('Valloric/YouCompleteMe') " , {
"\   'build' : 'sh -s "git submodule update --init --recursive && ./install.py"'
"\ })

" Plug ('SirVer/ultisnips')
" Plug ('honza/vim-snippets')

if has('nvim')
    Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
    Plug 'Shougo/deoplete.nvim'
endif
Plug 'Shougo/vimproc.vim', { 'do': 'make' }
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --bin' }

" Language plugins
Plug 'leafgarland/typescript-vim', { 'for': 'typescript' }
Plug 'Quramy/tsuquyomi', { 'for': 'typescript' }
Plug 'digitaltoad/vim-pug', { 'for': 'pug' }
" Plug ('rust-lang/rust.vim')
" Plug ('cespare/vim-toml')
" Plug ('tfnico/vim-gradle')
" Plug ('fatih/vim-go')
" Plug ('vim-scripts/javacomplete')

call plug#end()

filetype plugin indent on

" }}}
" Plugin configs {{{

" Netrw
let g:netrw_preview=1

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

let g:tagbar_type_rust = {
    \ 'ctagstype' : 'rust',
    \ 'kinds' : [
        \'T:types,type definitions',
        \'f:functions,function definitions',
        \'g:enum,enumeration names',
        \'s:structure names',
        \'m:modules,module names',
        \'c:consts,static constants',
        \'t:traits,traits',
        \'i:impls,trait implementations',
    \]
    \}

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

" Syntastic
let g:syntastic_go_checkers = ['golint', 'govet', 'errcheck']
let g:syntastic_rust_checkers = ['rustc']
let g:syntastic_mode_map = { 'mode': 'active', 'passive_filetypes': ['go'] }

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" Go
let g:go_list_type = "quickfix"

let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_fields = 1
let g:go_highlight_types = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1

" Rust
if executable('rustc')
    let g:ycm_rust_src_path = substitute(system('rustc --print sysroot'), '\n\+$', '', '') . '/lib/rustlib/src/rust/src'
endif

" Typescript
let g:tsuquyomi_completion_detail = 1

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

" Denite
if executable('ag')
    set grepprg=ag\ --follow\ --nogroup\ --nocolor

    " call denite#custom#var('file_rec', 'command',
    "             \ ['ag', '--follow', '--nocolor', '--nogroup', '-g', ''])
endif

" Deoplete
let g:deoplete#enable_at_startup = 1



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
map <leader>o       :Denite buffer file_rec<CR>
map <leader>w       :w<CR>
map <leader>sv      :so ~/.vimrc<CR>
vmap <leader>y      "+y
vmap <leader>d      "+d
nmap <leader>p      "+p
nmap <leader>P      "+P
vmap <leader>p      "+p
vmap <leader>P      "+P
map <leader><space> :nohlsearch<CR>
map <leader>pi      :PlugInstall<CR>
map <leader>pu      :PlugUpdate<CR>
" map <leader>pl      :echo dein#get_log()<CR>
map <leader>tf      :NERDTreeToggle<CR>
map <leader>tt      :TagbarToggle<CR>
map <leader>tc      :tabnew<CR>
map <leader>tx      :tabclose<CR>
map <leader>tn      :tabnext<CR>
map <leader>tp      :tabprev<CR>
map <C-b>n          :bn<CR>
map <C-b>p          :bp<CR>
map <C-b>s          :buffers<CR>
map <C-b>d          :bp \| bd #<CR>
map <C-b>b          :buffers<CR>:buffer<Space>
map <leader>bn      :bn<CR>
map <leader>bp      :bp<CR>
map <leader>bs      :buffers<CR>
map <leader>bd      :bp \| bd #<CR>
map <leader>bb      :buffers<CR>:buffer<Space>
map <leader>dm      :Make<CR>
map <leader>db      :Make!<CR>
map <leader>dd      :Dispatch<CR>
map <leader>ds      :Start<CR>
map <leader>co      :Copen<CR>
map <leader>cc      :cclose<CR>
map <leader>cn      :cnext<CR>
map <leader>cp      :cprevious<CR>
map <leader>ev      :e ~/.vimrc<CR>
map <leader>et      :e ~/.tmux.conf<CR>
map <leader>em      :e ./Makefile<CR>
map <leader>ep      :e ./.projections.json<CR>
map <leader>sc      :wa \| SyntasticCheck \| Errors<CR>
map <leader>se      :Errors<CR>
" }}}
" AutoCmds {{{
" Close vim if the last window is NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

" javacomplete

" haskellmode
autocmd Filetype *.hs compiler ghc

" rust
autocmd Filetype rust compiler cargo
autocmd Filetype rust nmap <leader>cb :Make build<CR>
autocmd Filetype rust nmap <leader>ct :Make test<CR>
autocmd Filetype rust nmap <leader>cr :Start cargo run<CR>

" 2 space indentation for json, javascript, ruby
autocmd Filetype javascript setlocal tabstop=2 shiftwidth=2
autocmd Filetype json setlocal tabstop=2 shiftwidth=2
autocmd Filetype ruby setlocal tabstop=2 shiftwidth=2

autocmd Filetype go nmap <leader>gr :GoRename<CR>
autocmd Filetype go nmap <leader>gc :SyntasticCheck errcheck<CR>
autocmd Filetype go nmap <leader>gl :SyntasticCheck<CR>

augroup omnifuncs
    autocmd!
    autocmd Filetype java setlocal omnifunc=javacomplete#Complete
    autocmd Filetype java setlocal completefunc=javacomplete#CompleteParamsInfo
    autocmd Filetype typescript setlocal omnifunc=tsuquyomi#complete
    autocmd Filetype typescript setlocal completeopt+=preview
augroup end

" }}}
