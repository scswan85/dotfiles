" This must be first, because it changes other options as a side effect.
set nocompatible

" source ~/.vimrc.before if it exists.
if filereadable(expand("~/.vimrc.before"))
source ~/.vimrc.before
endif

" ================ General Config ====================

execute pathogen#infect()
set number relativenumber                      "Line numbers are good
set backspace=indent,eol,start  "Allow backspace in insert mode
set history=1000                "Store lots of :cmdline history
set showcmd                     "Show incomplete cmds down the bottom
set showmode                    "Show current mode down the bottom
set gcr=a:blinkon0              "Disable cursor blink
set visualbell                  "No sounds
set autoread                    "Reload files changed outside vim
set lazyredraw                  "make stuff scroll faster!

" This makes vim act like all other editors, buffers can
" exist in the background without being in a window.
" http://items.sjbach.com/319/configuring-vim-right
set hidden


" Change leader to a comma because the backslash is too far away
" That means all \x commands turn into ,x
" The mapleader has to be set before vundle starts loading all 
" the plugins.
let mapleader=","
set timeout timeoutlen=1500

" ================ Turn Off Swap Files ==============

set noswapfile
set nobackup
set nowb

" ================ Persistent Undo ==================
" Keep undo history across sessions, by storing in file.
" Only works all the time.
if has('persistent_undo') && !isdirectory(expand('~').'/.vim/backups')
silent !mkdir ~/.vim/backups > /dev/null 2>&1
set undodir=~/.vim/backups
set undofile
endif

" ================ Folds ============================

set foldmethod=indent   "fold based on indent
set foldnestmax=3       "deepest fold is 3 levels
set nofoldenable        "dont fold by default

"
" ================ Scrolling ========================

set scrolloff=8         "Start scrolling when we're 8 lines away from margins
set sidescrolloff=15
set sidescroll=1

" ================ Search ===========================

set incsearch       " Find the next match as we type the search
set hlsearch        " Highlight searches by default
set ignorecase      " Ignore case when searching...
set smartcase       " ...unless we type a capital

" ================ Indentation ======================

set smartindent
set smarttab
set shiftwidth=2
set softtabstop=2
set tabstop=2
set expandtab

" ================ Packages =========================
let g:rubycomplete_buffer_loading = 1
let g:rubycomplete_rails = 1

" Get Ctrl-P working
set runtimepath^=~/.vim/bundle/ctrlp.vim

" NERD Tree auto start
"autocmd vimenter * NERDTree
nmap ,n :NERDTreeFind<CR>
nmap ,m :NERDTreeToggle<CR>

set runtimepath^=~/.vim/bundle/ag

" =============== Solarized (COLORS!) =================
syntax enable
set background=dark
colorscheme solarized
let g:solarized_base16 = 1
"============== EasyMotion ======================
nmap f <Plug>(easymotion-overwin-w)

"=============Syntastic====================
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
au BufRead,BufNewFile *.vue set ft=html

"============Added this to help someone on their homework==============
nnoremap <buffer> <F9> :exec '!python' shellescape(@%, 1)<cr>
let g:pymode_python = 'python3'

"=============Press <F2> if you paste stuff and it looks like garbage============
set pastetoggle=<F2>
