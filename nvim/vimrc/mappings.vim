nnoremap <leader>bf :BufOnly<cr>

nnoremap <leader>DM :!rsync -e ssh -azicuhP --delete --stats /mnt/mint-root/home/sumosud0/Projects/shaun-datatill-dev/ datatill@jd.datatill.com:/var/www/html/datatill/ --exclude='logs' --exclude='.hg' --exclude='.idea' --exclude='system_installation' 2> /dev/null<cr>

nnoremap <leader>TT :exec "Tabularize /".expand(matchstr(getline('.'), '\%' . col('.') . 'c.'))<cr>

" RipGrep
nnoremap <Space><Space><Space> :Rg<space>

" Search for the word under the cursor.
nnoremap <leader>A :exec "Rg ".expand("<cword>")<cr>
