" http://vim.wikia.com/wiki/Setting_file_attributes_without_reloading_a_buffer
function! SetExecutableBit()
  let fname = expand("%:p")
  checktime
  execute "au FileChangedShell " . fname . " :echo"
  silent !chmod u+x %
  checktime
  execute "au! FileChangedShell " . fname
endfunction
command! Xbit call SetExecutableBit()

" Make the file executable
nnoremap <leader>xx :Xbit<cr>

"
func! DeleteTrailingWS()
  exe "normal mz"
  %s/\s\+$//ge
  exe "normal `z"
endfunc

"autocmd BufWritePre * :call DeleteTrailingWS()


" Write the file on insert leave  ..
autocmd FocusLost,InsertLeave,BufLeave * :wa
" Change the fold color
autocmd BufEnter * :hi Folded guibg=grey guifg=blue
