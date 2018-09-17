" http://vim.wikia.com/wiki/Moving_to_matching_braces
set showmatch
set mat=2

" http://vim.wikia.com/wiki/Window_zooming_convenience
" Set some padding and minimums
" for better window stacking
set winwidth=999
set winheight=99
set winminheight=5
set winminwidth=3

"makes sure Vim doesn't try to make all windows equal.
set noequalalways

set completeopt=longest,menuone
" make tab completion for files/buffers act like bash
set wildmenu                    
" show a list when pressing tab and complete
set wildmode=list:full          
"    first full match
"set wildmode=list:longest,list:full

"
set expandtab                   " Expand tabs to spaces
set autoindent smartindent      " auto/smart indent
set copyindent                  " copy previous indentation on auto indent
set smarttab                    " At start of line, <Tab> inserts shift width spaces, <Bs> deletes shift width spaces.
set expandtab softtabstop=4 shiftwidth=4

set wrap                        " wrap lines
set textwidth=120

set title                " change the terminal's title
set visualbell           " don't beep
set noerrorbells         " don't beep

" see terminal edge
if (exists('+colorcolumn'))
  set colorcolumn=120
  highlight ColorColumn ctermbg=9
endif

