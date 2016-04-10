" Nice to have
syntax on		          					" enable syntax processing

" Encoding
set encoding=utf-8							" utf-8 encoding
set fileencoding=utf-8						" utf-8 encoding on files

" Show statusbar
set laststatus=2							" show statusbar
set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l


"##### VUNDLE #####################################
set nocompatible              				" be iMproved, required
filetype off                  				" required

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
Plugin 'airblade/vim-gitgutter'
Plugin 'https://github.com/jiangmiao/auto-pairs'
Plugin 'sjl/badwolf'
Plugin 'https://github.com/vim-scripts/xoria256.vim.git'
Plugin 'flazz/vim-colorschemes'
Plugin 'tomtom/tcomment_vim'
Plugin 'tpope/vim-fugitive'

call vundle#end()            				" required
filetype plugin indent on    				" required


"##### CUSTOM #####################################
set t_Co=256								" set 256 color
"colorscheme Tomorrow-Night					" awesome colorscheme
"set softtabstop=2   						" number of spaces in tab when editing
set expandtab       						" tabs are spaces
set number              					" show line numbers
set showcmd             					" show command in bottom bar
set wildmenu            					" visual autocomplete for command menu
set lazyredraw          					" redraw only when we need to.
set showmatch           					" highlight matching [{()}]
set incsearch           					" search as characters are entered
"set hlsearch            					" highlight matches
set foldenable          					" enable folding
set autoread								" Set to auto read when a file is changed from the outside
set omnifunc=syntaxcomplete#Complete    	" enable omnicomplete

set so=7
let $LANG='en' 
set langmenu=en
set ruler
set cmdheight=2
set hid
set backspace=eol,start,indent
set whichwrap+=<,>,h,l
set ignorecase
set smartcase
set magic
set mat=2
set foldcolumn=1
syntax enable
set nobackup
set nowb
set noswapfile
set smarttab
set shiftwidth=2
set tabstop=2
set lbr
set tw=500
set ai
set si
set wrap


"##### NERDTREE ###################################
map <C-n> :NERDTreeToggle<CR>
let g:NERDTreeDirArrowExpandable = '→'
let g:NERDTreeDirArrowCollapsible = '↓'
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif


"##### CTRL P #####################################
let g:ctrlp_working_path_mode = 0

let g:ctrlp_map = '<c-f>'
map <leader>j :CtrlP<cr>
map <c-b> :CtrlPBuffer<cr>

let g:ctrlp_max_height = 20
let g:ctrlp_custom_ignore = 'node_modules\|^\.DS_Store\|^\.git\|^\.coffee\|^\bower_components'


"##### EMMET ######################################
let g:user_emmet_expandabbr_key = '<c-e>'
let g:user_emmet_mode='a'    "enable all function in all mode.


"##### AIRLINE ####################################
let g:airline_theme="badwolf"


"##### GITGUTTER ##################################
let g:gitgutter_enabled=0
nnoremap <silent> <leader>d :GitGutterToggle<cr>


"##### NEOCOMPLETE ################################
let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_smart_case = 1

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion.
if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return (pumvisible() ? "\<C-y>" : "" ) . "\<CR>"
  " For no inserting <CR> key.
  "return pumvisible() ? "\<C-y>" : "\<CR>"
endfunction
" <ENTER>: completion.
inoremap <expr><ENTER>  pumvisible() ? "\<C-n>" : "\<ENTER>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
" Close popup by <Space>.
inoremap <expr><Space> pumvisible() ? "\<C-y>" : "\<Space>"


"##### EXTRAS #####################################

" => Fast editing and reloading of vimrc configs
map <leader>e :e! ~/.vim_runtime/my_configs.vim<cr>
autocmd! bufwritepost vimrc source ~/.vim_runtime/my_configs.vim

" => Turn persistent undo on 
try
    set undodir=~/.vim_runtime/temp_dirs/undodir
    set undofile
catch
endtry

" Quicker window movement
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l


" Make VIM remember position in file after reopen
if has("autocmd")
   au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

""" SYSTEM CLIPBOARD COPY & PASTE SUPPORT
set pastetoggle=<F2> "F2 before pasting to preserve indentation
"Copy paste to/from clipboard
vnoremap <C-c> "*y
map <silent><Leader>p :set paste<CR>o<esc>"*]p:set nopaste<cr>"
map <silent><Leader><S-p> :set paste<CR>O<esc>"*]p:set nopaste<cr>"