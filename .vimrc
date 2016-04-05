" Nice to have
syntax on		          		" enable syntax processing

" Encoding
set encoding=utf-8				" utf-8 encoding
set fileencoding=utf-8			" utf-8 encoding on files

" Show statusbar
set laststatus=2				" show statusbar


"##### VUNDLE #####################################
set nocompatible              	" be iMproved, required
filetype off                  	" required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'scrooloose/nerdTree'
Plugin 'https://github.com/chriskempson/vim-tomorrow-theme.git'
Plugin 'https://github.com/ctrlpvim/ctrlp.vim.git'
Plugin 'mattn/emmet-vim'
Plugin 'https://github.com/tpope/vim-haml.git'
Plugin 'https://github.com/leafgarland/typescript-vim.git'
Plugin 'https://github.com/wavded/vim-stylus.git'
Plugin 'fatih/vim-go'
Plugin 'Shougo/neocomplete'
Plugin 'Shougo/neosnippet'
Plugin 'Shougo/neosnippet-snippets'

call vundle#end()            	" required
filetype plugin indent on    	" required


"##### CUSTOM #####################################
colorscheme Tomorrow-Night		" awesome colorscheme
set softtabstop=2   			" number of spaces in tab when editing
set expandtab       			" tabs are spaces
set number              		" show line numbers
set showcmd             		" show command in bottom bar
set wildmenu            		" visual autocomplete for command menu
set lazyredraw          		" redraw only when we need to.
set showmatch           		" highlight matching [{()}]
set incsearch           		" search as characters are entered
set hlsearch            		" highlight matches
set foldenable          		" enable folding
nnoremap <leader><space> :nohlsearch<CR>	" turn off search highlight


"##### NERDTREE ###################################
map <C-n> :NERDTreeToggle<CR>
let g:NERDTreeDirArrowExpandable = '→'
let g:NERDTreeDirArrowCollapsible = '↓'
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif


"##### CTRL P #####################################
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'


"##### EMMET ######################################
let g:user_emmet_expandabbr_key = '<Tab>'
let g:user_emmet_mode='a'    "enable all function in all mode.


"##### NEOCOMPLETE ################################
let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_smart_case = 1
