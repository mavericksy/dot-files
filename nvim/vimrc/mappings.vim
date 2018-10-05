nnoremap <leader>bf :BufOnly<cr>

nnoremap <leader>MP :!rsync -e ssh -azricu ~/external/number21/home/sumosud0/Projects/shaun-datatill-dev/ datatill@jd.datatill.com:/var/www/html/datatill/ --exclude='.hg' --exclude='.idea' --exclude='system_installation'
