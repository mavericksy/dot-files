nnoremap <leader>bf :BufOnly<cr>

nnoremap <leader>DM :!rsync -e ssh -azicuhP --delete --stats /home/sumosudo/Projects/datatill/shaun-datatill-dev/ datatill@jd.datatill.com:/var/www/html/datatill/ --exclude='vendor' --exclude='logs' --exclude='fileupload' --exclude='.hg' --exclude='.idea' --exclude='system_installation' 2> /dev/null<cr>

nnoremap <leader>BM :!rsync -e ssh -azicuhP --delete --stats /home/sumosudo/Projects/datatill/shaun-datatill-dev/ 160.119.250.21:/home/sumosudo/bcks/shaun-datatill 2> /dev/null<cr>

nnoremap <leader>TT :exec "Tabularize /".expand(matchstr(getline('.'), '\%' . col('.') . 'c.'))<cr>

" RipGrep
nnoremap <Space><Space><Space> :Rg<space>

" Search for the word under the cursor.
nnoremap <leader>A :exec "Rg ".expand("<cword>")<cr>

" quickly open a buffer list and wait for user command
nnoremap \\ :ls<CR>:b<Space>


" PlantUML Make
nnoremap <F3> :w<CR> :silent make<CR>
inoremap <F3> <Esc>:w<CR>:silent make<CR>
vnoremap <F3> :<C-U>:w<CR>:silent make<CR>
