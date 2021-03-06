set nocompatible              " be iMproved, required filetype off                  " required

call plug#begin('~/.vim/plugged')
" VUNDLE
" PLUGINS GO HERE
Plug 'bling/vim-airline'
Plug 'Yggdroot/indentLine'
Plug 'scrooloose/nerdtree'
Plug 'Raimondi/delimitMate'
Plug 'editorconfig/editorconfig-vim'
Plug 'kien/ctrlp.vim'
Plug 'morhetz/gruvbox'
Plug 'benekastah/neomake'

" Languages
"
"" Javascript
Plug 'mxw/vim-jsx'
Plug 'mustache/vim-mustache-handlebars'
Plug 'pangloss/vim-javascript'
Plug 'heavenshell/vim-jsdoc'

"" HTML/CSS
Plug 'tpope/vim-liquid'
Plug 'JulesWang/css.vim'
Plug 'cakebaker/scss-syntax.vim'
Plug 'mattn/emmet-vim', { 'for': 'html' }

"" Other Languages
Plug 'elixir-lang/vim-elixir', { 'for': 'elixir' }
Plug 'lambdatoast/elm.vim', { 'for': 'elm' }
Plug 'fatih/vim-go', { 'for': 'go' }
call plug#end()

" Use the OS clipboard by default (on versions compiled with `+clipboard`)
set clipboard=unnamed
" Enhance command-line completion
set wildmenu
" Allow curseys in insert mode
set esckeys
" Allow backspace in insert mode
set backspace=2
" Optimize for fast terminal connections
set ttyfast
" Add the g flag to search/replace by default
set gdefault
" Use UTF-8 without BOM
set encoding=utf-8 nobomb
" Change mapleader
let mapleader=" "
" Don’t add empty newlines at the end of files
set binary
set noeol
" Centralize backups, swapfiles and undo history
set backupdir=~/.config/nvim/backups
set directory=~/.config/nvim/swaps
if exists("&undodir")
	set undodir=~/.config/nvim/undo
endif

" Respect modeline in files
set modeline
set modelines=4
" Enable per-directory .vimrc files and disable unsafe commands in them
set exrc
set secure
" Enable line numbers
set number
" Enable syntax highlighting
syntax on
" Highlight current line
set nocursorline
set nocursorcolumn
" Make tabs as wide as two spaces
set tabstop=2
" Show “invisible” characters
set lcs=tab:▸\ ,trail:·,eol:¬,nbsp:_
set list
" Highlight searches
set hlsearch
" Highlight dynamically as pattern is typed set incsearch
" Always show status line
set laststatus=2
" Enable mouse in all modes
set mouse=a
" Disable error bells
set noerrorbells
" Don’t reset cursor to start of line when moving around.
set nostartofline
" Show the cursor position
set ruler
" Don’t show the intro message when starting Vim
set shortmess=atI
" Show the current mode
set showmode
" Show the filename in the window titlebar
set title
" Show the (partial) command as it’s being typed
set showcmd
" Use relative line numbers
if exists("&relativenumber")
	set relativenumber
	au BufReadPost * set relativenumber
endif
" Start scrolling three lines before the horizontal window border
set scrolloff=3

" Strip trailing whitespace (,ss)
function! StripWhitespace()
	let save_cursor = getpos(".")
	let old_query = getreg('/')
	:%s/\s\+$//e
	call setpos('.', save_cursor)
	call setreg('/', old_query)
endfunction
noremap <leader>ss :call StripWhitespace()<CR>
" Save a file as root (,W)
noremap <leader>W :w !sudo tee % > /dev/null<CR>

" Automatic commands
if has("autocmd")
	" Enable file type detection
	filetype on
	" Treat .json files as .js
	autocmd BufNewFile,BufRead *.json setfiletype json syntax=javascript
	autocmd BufNewFile,BufRead *.jsx setfiletype jsx syntax=javascript
  " Use css and js syntax highlighting for liquid
  autocmd BufNewFile,BufRead *.scss.liquid setfiletype scss syntax=css
	autocmd BufNewFile,BufRead *.js.liquid setfiletype js syntax=javascript

endif

filetype plugin indent on

set tabstop=2
set shiftwidth=2
set expandtab

autocmd Filetype html setlocal ts=2 sw=2 expandtab
autocmd Filetype ruby setlocal ts=2 sw=2 expandtab
autocmd Filetype javascript setlocal ts=2 sw=2 sts=0 expandtab
autocmd Filetype liquid setlocal ts=2 sw=2 expandtab
autocmd Filetype go setlocal noet ts=4 sw=4 sts=4 expandtab
inoremap jj <ESC>

noremap <S-w> <C-w><C-w>

let g:html_indent_tags = 'li\|p'

syntax enable
set background=dark
let $NVIM_TUI_ENABLE_TRUE_COLOR=1
colorscheme gruvbox

" turn off arrow keys
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

" Nerdtree
autocmd vimenter * NERDTree

autocmd! BufWritePost * Neomake
let g:neomake_javascript_enabled_makers = ['eslint']
let g:neomake_javascript_eslint_maker = {
\ 'args': ['--no-color', '--format', 'compact'],
\ 'errorformat': '%f: line %l\, col %c\, %m'
\ }
let g:ruby_path = system('echo $HOME/.rbenv/shims')

set runtimepath^=~/.vim/bundle/ctrlp.vim
