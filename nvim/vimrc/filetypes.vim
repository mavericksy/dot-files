" Asdf is lisp
autocmd! VimEnter,BufRead,BufNewFile *.asd set filetype=lisp
" And qt
autocmd! VimEnter,BufRead,BufNewFile,WinEnter *.qt set filetype=quicktask

" ejs are HTML
autocmd! VimEnter,BufRead,BufNewFile,WinEnter *.ejs set filetype=html

" PHP
autocmd! VimEnter,BufRead,BufNewFile *.php set filetype=php

autocmd! BufRead,WinEnter *.m set filetype=html

