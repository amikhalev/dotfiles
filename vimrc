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

Plug 'sjl/gundo.vim'
Plug 'rking/ag.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'dracula/vim'

Plug 'tpope/vim-commentary'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
" Plug ('tpope/vim-projectionist')
Plug 'tpope/vim-eunuch'

Plug 'w0rp/ale'
Plug 'Yggdroot/indentLine'
" Plug ('Raimondi/delimitMate')
" Plug ('Lokaltog/vim-easymotion')
Plug 'junegunn/vim-easy-align'
Plug 'majutsushi/tagbar'
Plug 'edkolev/promptline.vim'
Plug 'radenling/vim-dispatch-neovim'


" Plug ('SirVer/ultisnips')
" Plug ('honza/vim-snippets')

if has('nvim')
    Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
    Plug 'mhartington/nvim-typescript', { 'do': ':UpdateRemotePlugins' }
    Plug 'Shougo/denite.nvim', { 'do': ':UpdateRemotePlugins' }
else
    Plug 'roxma/nvim-yarp'
    Plug 'roxma/vim-hug-neovim-rpc'
    Plug 'Shougo/deoplete.nvim'
    Plug 'Shougo/denite.nvim'
endif
Plug 'Shougo/vimproc.vim', { 'do': 'make' }

" Language plugins
Plug 'leafgarland/typescript-vim', { 'for': 'typescript' }
"Plug 'Quramy/tsuquyomi', { 'for': 'typescript' }
Plug 'digitaltoad/vim-pug', { 'for': 'pug' }
Plug 'zchee/deoplete-clang', { 'for': ['c', 'cpp'] }
" Plug ('rust-lang/rust.vim')
" Plug ('cespare/vim-toml')
" Plug ('tfnico/vim-gradle')
" Plug ('fatih/vim-go')
" Plug ('vim-scripts/javacomplete')
" Plug ('phildawes/racer', {
" \   'if' : executable('cargo'),
" \   'build' : 'cargo build --release'
" \ })
" Plug ('Valloric/YouCompleteMe') " , {
"\   'build' : 'sh -s "git submodule update --init --recursive && ./install.py"'
"\ })
" Plug ('lukerandall/haskellmode-vim')

call plug#end()

filetype plugin indent on

" }}}
" Plugin configs {{{

" Netrw
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 4
let g:netrw_altv = 1
let g:netrw_winsize = 20
let g:netrw_preview = 1

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
let g:airline_powerline_fonts=1
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

" ALE
let g:ale_linters = {
            \    'typescript': ['tsserver', 'tslint'],
            \}
let g:ale_fixers = {
            \    'typescript': ['tslint'],
            \}

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
silent! colorscheme dracula " Some nice colors

syntax enable      " That nice syntax highlighting

if has("gui_running")
    set guifont=Input\ Mono:h11,Inconsolata\ Awesome:h14,Menlo\ Regular:h12,Fira\ Code:h12
endif

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

    call denite#custom#var('file_rec', 'command',
                \ ['ag', '--follow', '--nocolor', '--nogroup', '-g', ''])
endif

" Deoplete
let g:deoplete#enable_at_startup = 1
if !exists('g:deoplete#omni#input_patterns')
  let g:deoplete#omni#input_patterns = {}
endif
" let g:deoplete#complete_method = 'omnifunc'
let g:deoplete#enable_refresh_always = 1
let g:deoplete#enable_camel_case = 1
let g:deoplete#disable_auto_complete = 1

if has('macunix')
    let g:deoplete#sources#clang#libclang_path = '/Applications/Xcode.app/Contents/Frameworks/libclang.dylib'
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
tnoremap <A-h> <C-\><C-N><C-w>h
tnoremap <A-j> <C-\><C-N><C-w>j
tnoremap <A-k> <C-\><C-N><C-w>k
tnoremap <A-l> <C-\><C-N><C-w>l
inoremap <A-h> <C-\><C-N><C-w>h
inoremap <A-j> <C-\><C-N><C-w>j
inoremap <A-k> <C-\><C-N><C-w>k
inoremap <A-l> <C-\><C-N><C-w>l
nnoremap <A-h> <C-w>h
nnoremap <A-j> <C-w>j
nnoremap <A-k> <C-w>k
nnoremap <A-l> <C-w>l

" ESC is so far away...
inoremap  jk       <ESC>

" deoplete tab-complete
inoremap <silent><expr> <TAB>
            \ pumvisible() ? "\<C-n>" :
            \ <SID>check_back_space() ? "\<TAB>" :
            \ deoplete#mappings#manual_complete()
function! s:check_back_space() abort "{{{
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~ '\s'
endfunction "}}}
inoremap <expr><S-TAB>  pumvisible() ? "\<C-p>" : "\<C-h>"

autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif

" vim-easy-align
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

" }}}
" Leader mappings {{{
map <leader>q       :q<CR>
map <leader>w       :w<CR>
map <leader>wq      :wq<CR>
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
map <leader>tf      :20Lexplore<CR>
map <leader>tt      :TagbarToggle<CR>
map <leader>tl      :set relativenumber!<CR>
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
map <leader>lf      :ALEFix<CR>
map <leader>gs      :Gstatus<CR>
map <leader>gc      :Gcommit -v<CR>
map <leader>ev      :e ~/.vimrc<CR>
map <leader>et      :e ~/.tmux.conf<CR>
map <leader>em      :e ./Makefile<CR>
map <leader>ep      :e ./.projections.json<CR>
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
    autocmd Filetype typescript setlocal completeopt+=preview
augroup end

" }}}
