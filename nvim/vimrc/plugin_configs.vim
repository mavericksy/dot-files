autocmd VimEnter * TagbarToggle

autocmd BufEnter NERD_tree_2 :vertical resize 32

autocmd BufEnter __Tagbar__.1 :vertical resize 28

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                                    VIM-JAVSCRIPT                                                     "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:javascript_conceal_function             = "ƒ"
let g:javascript_conceal_null                 = "ø"
let g:javascript_conceal_this                 = "@"
let g:javascript_conceal_return               = "⇚"
let g:javascript_conceal_undefined            = "¿"
let g:javascript_conceal_NaN                  = "ℕ"
let g:javascript_conceal_prototype            = "¶"
let g:javascript_conceal_static               = "•"
let g:javascript_conceal_super                = "Ω"
let g:javascript_conceal_arrow_function       = "⇒"
let g:javascript_conceal_noarg_arrow_function = "🞅"
let g:javascript_conceal_underscore_arrow_function = "🞅"

" prettier JS
autocmd FileType javascript set formatprg=prettier\ --stdin

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                                       DEOPLETE                                                       "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:deoplete#enable_at_startup = 1
let g:deoplete#enable_ignore_case = 1
let g:deoplete#auto_complete_delay= 30
let g:deoplete#auto_refresh_delay= 5
let g:deoplete#auto_complete_start_length = 1
let g:deoplete#enable_smart_case = 1
let g:deoplete#enable_camel_case = 1
let g:deoplete#enable_refresh_always = 1
let g:deoplete#max_abbr_width = 0
let g:deoplete#max_menu_width = 0

let g:deoplete#sources = {}
let g:deoplete#omni#functions = {}
let g:deoplete#ignore_sources = get(g:, 'deoplete#ignore_sources', {})

let g:deoplete#omni#functions.javascript = [
  \ 'tern#Complete',
  \ 'jspc#omni'
\]

let g:deoplete#sources.javascript = ['file', 'ultisnips', 'ternjs']
let g:tern#command = ['tern']
let g:tern#arguments = ['--persistent']
let g:tern_request_timeout = 1
let g:tern_request_timeout = 6000

" needed for echodoc to work if add_parentheses is 1
let g:deoplete#skip_chars = ['$']

let g:deoplete#ignore_sources.php = ['omni']

"let g:deoplete#sources.php = ['padawan', 'ultisnips', 'tags', 'buffer', 'file']
let g:deoplete#sources._ = ['omni', 'buffer', 'member', 'tags', 'ultisnips', 'file']

if !exists('g:deoplete#omni#input_patterns')
        let g:deoplete#omni#input_patterns = {}
endif

call deoplete#custom#source('ultisnips', 'matchers', ['matcher_fuzzy'])
call deoplete#custom#set('ultisnips', 'matchers', ['matcher_fuzzy'])
let deoplete#sources#jedi#show_docstring = 1

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                  UltiSnips                                   "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:snips_author = 'Shaun Pearce <shaun@datatill.com>'
let g:ultisnips_php_scalar_types = 1
let g:UltiSnipsExpandTrigger="<c-t>"
let g:UltiSnipsJumpForwardTrigger="<c-k>"
let g:UltiSnipsJumpBackwardTrigger="<c-j>"

inoremap <expr><tab> pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr><s-tab> pumvisible() ? "\<C-p>" : "\<TAB>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"
let g:UltiSnipsSnippetsDir = $HOME.'/.config/nvim/snips'
let g:UltiSnipsSnippetDirectories = ['/home/sumosudo/.config/nvim/snips', 'UltiSnips']
"
map <F7> :UltiSnipsEdit<CR>

let g:UltiSnipsListSnippets = '<C-S-tab>'
let g:ulti_expand_res = 0

function! Ulti_ExpandOrEnter()
        " First try to expand a snippet
        call UltiSnips#ExpandSnippet()
        if g:ulti_expand_res
                " if successful, just return
                return ''
        elseif pumvisible()
                " if in completion menu - just close it and leave the cursor at the
                " end of the completion
                return deoplete#mappings#close_popup()
        else
                " otherwise, just do an "enter"
                return "\<return>"
        endif
endfunction
inoremap <return> <C-R>=Ulti_ExpandOrEnter()<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                                       V-DEBUG"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                                     VIM-RIPGREP                                                      "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:rg_highlight=1
let g:rg_root_types=['.git', '.hg']
let g:rg_command="rg -g '!tags' --vimgrep"

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                                       LATEX                                                       "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:tex_flavor='latex'

