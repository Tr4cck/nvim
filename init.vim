" __  ____   __  _   ___     _____ __  __ ____   ____
"|  \/  \ \ / / | \ | \ \   / /_ _|  \/  |  _ \ / ___|
"| |\/| |\ V /  |  \| |\ \ / / | || |\/| | |_) | |
"| |  | | | |   | |\  | \ V /  | || |  | |  _ <| |___
"|_|  |_| |_|   |_| \_|  \_/  |___|_|  |_|_| \_\\____|

" Author: @Tr4cck

" TODO
" lua-scripting
" auto-completion


" ===
" === Auto load for first time uses
" ===
if empty(glob($HOME.'/.config/nvim/autoload/plug.vim'))
    silent !curl -fLo $HOME/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif


" ====================
" === Editor Setup ===
" ====================
" ===
" === System
" ===
let &t_ut=''
set autochdir

" ===
" === Editor behavior
" ===
if has("syntax")
    syntax enable
    syntax on
endif
let mapleader = " "
set notimeout
set tw=0
set number
set relativenumber
set cursorline
set wrap
set showcmd
set wildmenu
set hlsearch
exec "nohlsearch"
set incsearch
set ignorecase
set smartcase

set nocompatible
filetype on
filetype indent on
filetype plugin on
filetype plugin indent on

set encoding=utf-8
set hidden
set noexpandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4
set autoindent
set list
set listchars=tab:▸\ ,trail:▫
set scrolloff=8
set indentexpr=
set backspace=indent,eol,start
set foldmethod=indent
set foldlevel=99
set formatoptions-=tc
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_SR = "\<Esc>]50;CursorShape=2\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"

set viewoptions=cursor,folds
set inccommand=split
set completeopt=longest,noinsert,menuone,noselect,preview
set laststatus=2
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

set tags=./tags,tags;$HOME " help project to find ctags file

silent !mkdir -p $HOME/.config/nvim/tmp/backup
silent !mkdir -p $HOME/.config/nvim/tmp/undo
"silent !mkdir -p $HOME/.config/nvim/tmp/sessions
set backupdir=$HOME/.config/nvim/tmp/backup,.
set directory=$HOME/.config/nvim/tmp/backup,.
if has('persistent_undo')
	set undofile
	set undodir=$HOME/.config/nvim/tmp/undo,.
endif

" ===
" === Basic Mappings
" ===
map s <nop>
map S :w<CR>
map Q :q<CR>
map R :source $MYVIMRC<CR>
map J 10j
map K 10k
map <LEADER><CR> :nohlsearch<CR>

map sy :set nosplitright<CR>:vsplit<CR>
map su :set splitbelow<CR>:split<CR>
map si :set nosplitbelow<CR>:split<CR>
map so :set splitright<CR>:vsplit<CR>

map <LEADER><left>  <C-w>h
map <LEADER><down>  <C-w>j
map <LEADER><up>    <C-w>k
map <LEADER><right> <C-w>l
map <left> :vertical resize -5<CR> 
map <down> :res -5<CR> 
map <up> :res +5<CR>
map <right> :vertical resize +5<CR>

map tg :tabe<CR> 
map tu :-tabnext<CR>
map tn :+tabnext<CR>

map sv <C-w>t<C-w>H
map sh <C-w>t<C-w>K

" Duplicate words
map <LEADER>fd /\(\<\w\+\>\)\_s*\1

" Spelling check with <space>sc
map <LEADER>sc :set spell!<CR>
noremap <C-x> ea<C-x>s
inoremap <C-x> <Esc>ea<C-x>s

" Press space twice to jump to the next '<++>' and edit it
map <LEADER><LEADER> <Esc>/<++><CR>:nohlsearch<CR>c4i

" Clipboard
" set clipboard = unnamedplus
vnoremap Y "+y
nnoremap Y y$

" Hex Editor
map hex :%!xxd<CR>

" Open terminal
map ter :term<CR>

"=====================
"|                   |
"|       Plugs       |
"|                   |
"=====================

call plug#begin('$HOME/.config/nvim/plugged')

" Check my status with <c-r> / " / @
Plug 'junegunn/vim-peekaboo'

" Status line
Plug 'ojroques/vim-scrollstatus'
Plug 'petertriho/nvim-scrollbar'
Plug 'vim-airline/vim-airline'

" Pretty dress
Plug 'connorholyday/vim-snazzy'

" Treesitter
Plug 'nvim-treesitter/nvim-treesitter'
Plug 'nvim-treesitter/playground'

" File navigation
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'Xuyuanp/nerdtree-git-plugin'

" Taglist
Plug 'majutsushi/tagbar', { 'on': 'TagbarOpenAutoClose' }

" Error checking
Plug 'w0rp/ale'

" Undo Tree
Plug 'mbbill/undotree/'

" Git
Plug 'rhysd/conflict-marker.vim'
Plug 'tpope/vim-fugitive'
Plug 'mhinz/vim-signify'
Plug 'gisphm/vim-gitignore', { 'for': ['gitignore', 'vim-plug'] }

" HTML, CSS, JavaScript, PHP, JSON, etc.
Plug 'elzr/vim-json'
Plug 'hail2u/vim-css3-syntax'
Plug 'spf13/PIV', { 'for' :['php', 'vim-plug'] }
Plug 'gko/vim-coloresque', { 'for': ['vim-plug', 'php', 'html', 'javascript', 'css', 'less'] }
Plug 'pangloss/vim-javascript', { 'for' :['javascript', 'vim-plug'] }
Plug 'mattn/emmet-vim'

" Python
Plug 'vim-scripts/indentpython.vim'

" Markdown
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install_sync() }, 'for' :['markdown', 'vim-plug'] }
Plug 'dhruvasagar/vim-table-mode', { 'on': 'TableModeToggle' }
Plug 'vimwiki/vimwiki'

" Bookmarks
Plug 'kshenoy/vim-signature'

" Other useful utilities
Plug 'junegunn/goyo.vim' " distraction free writing mode
Plug 'tpope/vim-surround' " type ysks' to wrap the word with '' or type cs'` to change 'word' to `word`
Plug 'godlygeek/tabular' " type ;Tabularize /= to align the =
Plug 'gcmt/wildfire.vim' " in Visual mode, type i' to select all text in '', or type i) i] i} ip
Plug 'scrooloose/nerdcommenter' " in <space>cc to comment a line

" Dependencies
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'kana/vim-textobj-user'
Plug 'fadein/vim-FIGlet'

" Change Surround
Plug 'tpope/vim-surround'
Plug 'gcmt/wildfire.vim'

" Multi-cursors
Plug 'mg979/vim-visual-multi'

" Code snippets
Plug 'SirVer/ultisnips'

" Golang support
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

" Other visual enhancement
Plug 'nathanaelkane/vim-indent-guides'
Plug 'itchyny/vim-cursorword'
Plug 'luochen1990/rainbow'
Plug 'mg979/vim-xtabline'
Plug 'ryanoasis/vim-devicons'
Plug 'wincent/terminus'

call plug#end()


"====================
"|                  |
"|    PlugConfig    |
"|                  |
"====================

" ===
" === Scroll
" ===
let g:airline_section_x = '%{ScrollStatus()}'

" ===
" === Colorscheme
" ===

" colorscheme nord
set t_Co=256
set termguicolors

let g:SnazzyTransparent = 1
colorscheme snazzy

let g:lightline = {
\ 'colorscheme': 'snazzy',
\ }
"
" ===
" === NERDTree-git
" ===

let g:NERDTreeGitStatusIndicatorMapCustom = {
                \ 'Modified'  :'✹',
                \ 'Staged'    :'✚',
                \ 'Untracked' :'✭',
                \ 'Renamed'   :'➜',
                \ 'Unmerged'  :'═',
                \ 'Deleted'   :'✖',
                \ 'Dirty'     :'✗',
                \ 'Ignored'   :'☒',
                \ 'Clean'     :'✔︎',
                \ 'Unknown'   :'?',
                \ }

" ===
" === NERDTree
" ===

map tt :NERDTreeToggle<CR>

let NERDTreeMapOpenExpl = ""
let NERDTreeMapUpdir = ""
let NERDTreeMapUpdirKeepOpen = "l"
let NERDTreeMapOpenSplit = ""
let NERDTreeOpenVSplit = ""
let NERDTreeMapActivateNode = "i"
let NERDTreeMapOpenInTab = "o"
let NERDTreeMapPreview = ""
let NERDTreeMapCloseDir = "n"
let NERDTreeMapChangeRoot = "y"


" ===
" === MarkdownPreview
" ===
let g:mkdp_auto_start = 0
let g:mkdp_auto_close = 1
let g:mkdp_refresh_slow = 0
let g:mkdp_command_for_global = 0
let g:mkdp_open_to_the_world = 0
let g:mkdp_open_ip = ''
let g:mkdp_browser = 'chromium'
let g:mkdp_echo_preview_url = 0
let g:mkdp_browserfunc = ''
let g:mkdp_preview_options = {
    \ 'mkit': {},
    \ 'katex': {},
    \ 'uml': {},
    \ 'maid': {},
    \ 'disable_sync_scroll': 0,
    \ 'sync_scroll_type': 'middle',
    \ 'hide_yaml_meta': 1
    \ }
let g:mkdp_markdown_css = ''
let g:mkdp_highlight_css = ''
let g:mkdp_port = ''
let g:mkdp_page_title = '「${name}」'

" ===
" === Visual enhancement
" ===
let g:rainbow_active = 1
