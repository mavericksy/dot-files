nnoremap <leader>bf :BufOnly<cr>

nnoremap <leader>DM :!rsync -e ssh -azrcu ~/external/number21/home/sumosud0/Projects/shaun-datatill-dev/ datatill@jd.datatill.com:/var/www/html/datatill/ --exclude='.hg' --exclude='.idea' --exclude='system_installation'<cr>

nnoremap <leader>TT :exec "Tabularize /".expand(matchstr(getline('.'), '\%' . col('.') . 'c.'))<cr>

" RipGrep
nnoremap <Space><Space><Space> :Rg<space>
nnoremap <leader>A :exec "Rg ".expand("<cword>")<cr>

