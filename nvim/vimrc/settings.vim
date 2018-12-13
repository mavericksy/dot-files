" Line number of the cursor
set nu
" Relative distance of a line from the cursor
set relativenumber
" 256 termainl http://vim.wikia.com/wiki/256_colors_in_vim
set t_Co=256
" Truecolor
set termguicolors
"Always display the status line
set laststatus=2
"
set encoding=utf-8
"
set termencoding=utf-8
" Sometimes useful
set mouse=a
" Expected behavior of backspace
set backspace=indent,eol,start
"
set ruler
" show key commands in status bar
set showcmd
" Go to search as typed
set incsearch
" Highlight the search terms
set hlsearch
" Read files changed externally.
set autoread
"
" Check file attributes on focus
au FocusGained * :checktime
"
" --- performance / buffer ---
" can put buffer to the background without writing
set hidden                  

"   to disk, will remember history/marks.
" don't update the display while executing macros
set lazyredraw             

" Send more characters at a given time.
set ttyfast                 

set magic

set history=999             " history (default = 20)
set undolevels=999          " Moar undo (default=100)

" --- backup and swap files ---
set nobackup
set nowritebackup
set noswapfile

set nomodeline                  " disable mode lines (security measure)
set nocursorline

" Remember info about open buffers on close
set viminfo^=%

"
let g:matchparen_timeout = 20
let g:matchparen_insert_timeout = 20
