set nocompatible
filetype plugin indent on
syntax on

source $HOME/.config/nvim/vimrc/filetypes.vim
source $HOME/.config/nvim/vimrc/looks.vim
source $HOME/.config/nvim/vimrc/mappings.vim
source $HOME/.config/nvim/vimrc/misc.vim
source $HOME/.config/nvim/vimrc/plugins.vim
source $HOME/.config/nvim/vimrc/plugin_configs.vim
source $HOME/.config/nvim/vimrc/settings.vim
source $HOME/.config/nvim/vimrc/spelling.vim

" Source a local vimrc if it exists
if filereadable(expand("$HOME/.config/nvim/nvimrc.local"))
  source $HOME/config/nvim/nvimrc.local
endif

"autocmd WinLeave * if @% != 'REPL' |
""      \ :exe bufwinnr(bufname('REPL')) "windo resize 6" | :winc p | endif


autocmd WinLeave * if @% == 'REPL' |
     \ :resize 6 | endif

"autocmd WinEnter * if @% != 'REPL' |
      "\ :exe bufwinnr(bufname('REPL')) "windo resize 6" | :winc p |endif

autocmd WinEnter * if @% == 'REPL' |
      \ :resize 18 | endif

""autocmd BufEnter * if @% == 'SLDB' |
"""      \ :resize 999 | endif

""autocmd BufLeave * if @% == 'REPL' || @% == 'Shell One' |
"""      \ :resize 6 | endif

" -----------------------------------------------------------------------------
" INDENTATION AND TEXT-WRAP
" -----------------------------------------------------------------------------

set pastetoggle=<F2>

" set the leader key
let mapleader = ","
let maplocalleader = "\\"

" Since I never use the ; key anyway, this is a real optimization for almost
" all Vim commands, as I don't have to press the Shift key to form chords to
" enter ex mode.
nnoremap ; :
nnoremap <leader>; ;

"Map - to delete the current line and paste it one line below
noremap - dd k P

" Uppercase current word
inoremap <c-u> <esc>viwUi
nnoremap <c-u> viwU

" Learn to use the jk key combo to escape insert mode
inoremap jk <esc>`^
inoremap jkl; <esc>:wq<cr>
inoremap <esc> <nop>

" Avoid accidental hits of <F1> while aiming for <Esc>
noremap! <F1> <Esc>

" Strip all trailing whitespace from a file, using ,lk
nnoremap <leader>lk :%s/\s+$//<CR>:let @/=''<CR>

" Sudo to write
cnoremap w!! w !sudo tee % >/dev/null

" Quickly edit/reload the vimrc file
nnoremap <silent> <leader>ev :e $MYVIMRC<CR>
nnoremap <silent> <leader>sv :so $MYVIMRC<CR>

" Quickly edit the php.ini file
nnoremap <silent> <leader>ep :e /etc/php.ini<CR>
nnoremap <silent> <leader>sp :! sudo systemctl restart httpd<CR>

" .tmux.conf
nnoremap <silent> <leader>et :e ~/.tmux.conf

" Use the damn hjkl keys
noremap <up> <nop>
noremap <down> <nop>
noremap <left> <nop>
noremap <right> <nop>

" Easy movement over wrapped lines
nnoremap j gj
nnoremap k gk

" Switch buffers
nmap <C-I> :bprev<CR>
nmap <C-O> :bnext<CR>
" Move between splits (windows)
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l

" clear highlighting from search
nnoremap <leader><space> :noh<cr>

" Better searching
nnoremap / /\v
vnoremap / /\v

" copy to system clipboard
vnoremap gy "+y
" copy whole file to system clipboard
noremap gY gg"+yG

" quickly open a buffer list and wait for user command
nnoremap <leader>gb :ls<CR>:b<Space>

" Lawrencium
nnoremap <leader>HL :Hglog<CR>
nnoremap <leader>HS :Hgstatus<CR>
nnoremap <leader>HC :Hgcommit<CR>
nnoremap <leader>HT :Hglogthis<CR>
nnoremap <leader>HA :Hgannotate<CR>

" RipGrep
nnoremap <Space><Space><Space> :Rg

" TagList
let Tlist_Use_Right_Window = 1
let Tlist_WinWidth = 20

" PHPCD
"let g:deoplete#ignore_sources = get(g:, 'deoplete#ignore_sources', {})
let g:deoplete#ignore_sources.php = ['omni']
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                   VIM-PAD                                    "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:pad#dir = '~/.notes'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                    MIRROR                                    "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <leader>mp :MirrorPush<CR>


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                     FZF                                      "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <C-p> :FZF<CR>


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                    VDEBUG                                    "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:vdebug_options = {}
let g:vdebug_options["port"] = 9000
let g:vdebug_keymap = {
\    "run" : "<F5>",
\    "run_to_cursor" : "<F9>",
\    "step_over" : "<F2>",
\    "step_into" : "<F3>",
\    "step_out" : "<F4>",
\    "close" : "<F6>",
\    "detach" : "<F7>",
\    "set_breakpoint" : "<F10>",
\    "get_context" : "<F11>",
\    "eval_under_cursor" : "<F12>",
\    "eval_visual" : "<F8>",
\}

" redefine the characters
autocmd VimEnter * sign define breakpt text= texthl=DbgBreakptSign linehl=DbgBreakptLine
autocmd VimEnter * sign define current text= texthl=DbgCurrentSign linehl=DbgCurrentLine

" map the project when used in a vagrant / vm | vm path : host past
" let g:vdebug_options["path_maps"] = {}


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                               refactor-toolbox                               "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:vim_php_refactoring_use_default_mapping = 0

let g:vim_php_refactoring_default_property_visibility = 'private'
let g:vim_php_refactoring_default_method_visibility = 'private'
let g:vim_php_refactoring_auto_validate_visibility = 1
let g:vim_php_refactoring_phpdoc = "pdv#DocumentCurrentLine"

autocmd FileType php nnoremap <buffer><leader>reu :call PhpExtractUse()<CR>
autocmd FileType php xnoremap <buffer><leader>rec :call PhpExtractConst()<CR>
autocmd FileType php nnoremap <buffer><leader>rep :call PhpExtractClassProperty()<CR>

autocmd FileType php nnoremap <buffer><leader>rrm :call PhpRenameMethod()<CR>

autocmd FileType php nnoremap <buffer><leader>rcp :call PhpCreateProperty()<CR>
autocmd FileType php nnoremap <buffer><leader>rrp :call PhpRenameClassVariable()<CR>

autocmd FileType php nnoremap <buffer><leader>rlv :call PhpRenameLocalVariable()<CR>
autocmd FileType php nnoremap <buffer><leader>rdu :call PhpDetectUnusedUseStatements()<CR>
autocmd FileType php xnoremap <buffer><leader>raa :call PhpAlignAssigns()<CR>
autocmd FileType php nnoremap <buffer><leader>rsg :call PhpCreateSettersAndGetters()<CR>

xnoremap <leader>rev :call PHPExtractVariable()<cr>

function! PHPExtractVariable()
    let l:name = input("Name of new variable: $")
    normal! gvx
    execute "normal! i$".l:name
    execute "normal! O$".l:name." = "
    normal! pa;
endfunction
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                   vim-bbye                                   "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <Leader>q :Bdelete<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                  Startify                                   "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:startify_session_dir = '~/.config/nvim/session'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                 PHP-CS-FIXER                                 "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" If php-cs-fixer is in $PATH, you don't need to define line below
" let g:php_cs_fixer_path = "~/php-cs-fixer.phar" " define the path to the php-cs-fixer.phar

" If you use php-cs-fixer version 1.x
let g:php_cs_fixer_level = "symfony"                   " options: --level (default:symfony)
let g:php_cs_fixer_config = "default"                  " options: --config
" If you want to define specific fixers:
"let g:php_cs_fixer_fixers_list = "linefeed,short_tag" " options: --fixers
"let g:php_cs_fixer_config_file = '.php_cs'            " options: --config-file
" End of php-cs-fixer version 1 config params

" If you use php-cs-fixer version 2.x
let g:php_cs_fixer_rules = "@PSR2"          " options: --rules (default:@PSR2)
"let g:php_cs_fixer_cache = ".php_cs.cache" " options: --cache-file
"let g:php_cs_fixer_config_file = '.php_cs' " options: --config
" End of php-cs-fixer version 2 config params

let g:php_cs_fixer_php_path = "php"               " Path to PHP
let g:php_cs_fixer_enable_default_mapping = 1     " Enable the mapping by default (<leader>pcd)
let g:php_cs_fixer_dry_run = 0                    " Call command with dry-run option
let g:php_cs_fixer_verbose = 0

nnoremap <silent><leader>fd :call PhpCsFixerFixDirectory()<CR>
nnoremap <silent><leader>ff :call PhpCsFixerFixFile()<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                   phpactor                                   "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Include use statement
nmap <Leader>pU :call phpactor#UseAdd()<CR>

" Invoke the context menu
nmap <Leader>pM :call phpactor#ContextMenu()<CR>

" Invoke the navigation menu
nmap <Leader>pN :call phpactor#Navigate()<CR>

" Goto definition of class or class member under the cursor
nmap <Leader>pG :call phpactor#GotoDefinition()<CR>

" Transform the classes in the current file
nmap <Leader>pT :call phpactor#Transform()<CR>

" Generate a new class (replacing the current file)
nmap <Leader>pC :call phpactor#ClassNew()<CR>

" Extract method from selection
vmap <silent><Leader>pE :<C-U>call phpactor#ExtractMethod()<CR>

" This use a global install of PHPActor and not the Vim plugin for even more
" configuration possibilities

nnoremap <leader>rmc :call phpactor#MoveFile()<cr>
nnoremap <leader>rcc :call phpactor#CopyFile()<cr>

nnoremap <leader>rmd :call phpactor#FindReferences()<cr>

nnoremap <leader>ric :call PHPModify("implement_contracts")<cr>
nnoremap <leader>rap :call PHPModify("add_missing_properties")<cr>

" Fill constructor
nnoremap <leader>rfc :call PHPModify("complete_constructor")<cr>

" Extract interface
nnoremap <leader>rei :call phpactor#ClassInflect()<cr>

" Extract method
xnoremap <silent><Leader>rem :<C-U>call phpactor#ExtractMethod()<CR>
nnoremap <leader>src :call phpactor#FindReferences()<cr>

" go to definition of a method / class / whatever via Ctags
" map <leader>] :vsp <CR>:exec("tag ".expand("<cword>"))<CR>
map <leader>] :call phpactor#GotoDefinition()<CR>

function! PHPModify(transformer)
    normal! ggdG
    execute "read !phpactor class:transform ".expand('%').' --transform='.a:transformer
    normal! ggdd
endfunction

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                   SrcExpl                                    "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:SrcExpl_refreshTime = 500
let g:SrcExpl_isUpdateTags = 0
"let g:SrcExpl_updateTagsCmd =
let g:SrcExpl_updateTagsKey = "<F12>"

nnoremap <Leader>sx :SrcExplToggle<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                   NEOMAKE                                    "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

autocmd BufWritePost * Neomake
let g:neomake_error_sign   = {'text': '✖', 'texthl': 'NeomakeErrorSign'}
let g:neomake_warning_sign = {'text': '∆', 'texthl': 'NeomakeWarningSign'}
let g:neomake_message_sign = {'text': '➤', 'texthl': 'NeomakeMessageSign'}
let g:neomake_info_sign    = {'text': 'ℹ', 'texthl': 'NeomakeInfoSign'}

" standard phpcs config
let g:neomake_php_phpcs_args_standard = 'PSR2'

" display warning for phpcs error
function! SetWarningType(entry)
  let a:entry.type = 'W'
endfunction

function! SetErrorType(entry)
  let a:entry.type = 'E'
endfunction

function! SetMessageType(entry)
  let a:entry.type = 'M'
endfunction

let g:neomake_php_enabled_makers = ['php', 'phpcs', 'phpmd']

let g:neomake_php_php_maker = {
        \ 'args': ['-l', '-d', 'display_errors=1', '-d', 'log_errors=0',
            \      '-d', 'xdebug.cli_color=0'],
        \ 'errorformat':
            \ '%-GNo syntax errors detected in%.%#,'.
            \ '%EParse error: %#syntax error\, %m in %f on line %l,'.
            \ '%EParse error: %m in %f on line %l,'.
            \ '%EFatal error: %m in %f on line %l,'.
            \ '%-G\s%#,'.
            \ '%-GErrors parsing %.%#',
       \ 'postprocess': function('SetErrorType'),
\ }

let g:neomake_php_phpcs_maker = {
        \ 'args': ['--report=csv', '--standard=PSR2'],
        \ 'errorformat':
            \ '%-GFile\,Line\,Column\,Type\,Message\,Source\,Severity%.%#,'.
            \ '"%f"\,%l\,%c\,%t%*[a-zA-Z]\,"%m"\,%*[a-zA-Z0-9_.-]\,%*[0-9]%.%#',
        \ 'postprocess': function('SetWarningType'),
 \ }

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                     LSP                                      "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" only start lsp when opening php files
"au filetype php LanguageClientStart


" use LSP completion on ctrl-x ctrl-o as fallback for padawan in legacy projects
"au filetype php set omnifunc=LanguageClient#complete

" no need for diagnostics, we're going to use neomake for that
let g:LanguageClient_diagnosticsEnable  = 0
let g:LanguageClient_signColumnAlwaysOn = 0

" I only use these 3 mappings
nnoremap <silent> gd :call LanguageClient_textDocument_definition()<CR>
nnoremap <silent> gr :call LanguageClient_textDocument_references()<CR>
nnoremap K :call LanguageClient_textDocument_hover()<cr>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                    GUNDO                                     "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

nnoremap <F4> :GundoToggle<CR>
let g:gundo_playback_delay=180
let g:gundo_auto_preview=1

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                    Pymode                                    "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:pymode_lint_on_write = 0

let g:indent_guides_enable_on_vim_startup = 1

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                               NERDCommentator                                "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1


" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1

" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'

" Set a language to use its alternate delimiters by default
let g:NERDAltDelims_java = 1

" Add your own custom formats or override the defaults
let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }

" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1

" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1
let g:NERDRemoveExtraSpaces=1


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                    TList                                     "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:Tlist_Use_Right_Window = 1
let g:Tlist_WinWidth = 45
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"QuickTask
let g:quicktask_autosave = 1

"Deoplete
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                   DeoPlete                                   "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set completeopt=longest,menuone,preview

let g:deoplete#sources#padawan#add_parentheses = 1
" needed for echodoc to work if add_parentheses is 1
let g:deoplete#skip_chars = ['$']

let g:deoplete#sources.php = ['padawan', 'ultisnips', 'tags', 'buffer', 'file']

let g:deoplete#sources = {}
let g:deoplete#sources._=['omni', 'buffer', 'member', 'tags', 'ultisnips', 'file']

" disable autocomplete by default
let b:deoplete_disable_auto_complete=1
call deoplete#custom#buffer_option('auto_complete', v:false)

if !exists('g:deoplete#omni#input_patterns')
        let g:deoplete#omni#input_patterns = {}
endif

let g:deoplete#auto_complete_delay= 75
let g:deoplete#auto_refresh_delay= 5
let g:deoplete#enable_smart_case = 1
let g:deoplete#enable_camel_case = 1
let g:deoplete#enable_refresh_always = 1
let g:deoplete#enable_at_startup = 1
let g:deoplete#auto_complete_start_length = 1
let g:deoplete#enable_at_startup = 1
call deoplete#custom#source('ultisnips', 'matchers', ['matcher_fuzzy'])
let deoplete#sources#jedi#show_docstring = 1
" deoplete tab-complete
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"

" vim-test
"
let test#strategy = 'asyncrun'
let test#strategy = 'dispatch'
let test#project_root = "/home/sumosudo/Projects/MyECommerce/playlottoinafrica/application/tests"
nmap <silent> <leader>tN :TestNearest<CR>
nmap <silent> <leader>tF :TestFile<CR>
nmap <silent> <leader>tS :TestSuite<CR>
nmap <silent> <leader>tL :TestLast<CR>
nmap <silent> <leader>tV :TestVisit<CR>

" NVIMUX
"
"lua require('nvimux').bootstrap()
let g:nvimux_prefix = '<C-a>'
let g:nvimux_open_term_by_default = 'true'
let g:nvimux_new_window_buffer = 'single'
let g:nvimux_quickterm_direction = 'botright'
let g:nvimux_quickterm_orientation = 'vertical'
let g:nvimux_quickterm_scope = 't'
let g:nvimux_quickterm_size = '80'

let g:pdv_template_dir = $HOME ."/.config/nvim/plugged/pdv/templates_snip"
nnoremap <leader>dk :call pdv#DocumentWithSnip()<CR>
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
let g:UltiSnipsSnippetDirectories = ['/home/sumosudo/.config/nvim/snips']

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


" == Airline
"
" Vim-Airline Configuration
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline_theme='hybrid'
let g:hybrid_custom_term_colors = 1
let g:hybrid_reduced_contrast = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline_highlighting_cache = 1

" == Auto-save
let g:auto_save = 1
let g:auto_save_silent = 1

" -- solarized personal conf
set background=dark
try
  colorscheme molokai
catch
endtry

" == VIM_PAD
let g:pad#dir="~/Documents/Notes"

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                   NERDTree                                   "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:NERDTreeWinSize = 38
let g:NERDTreeShowHidden=1
" Unite
"   depend on vimproc
"   ------------- VERY IMPORTANT ------------
"   you have to go to .vim/plugin/vimproc.vim and do a ./make
"   -----------------------------------------
let g:unite_source_history_yank_enable = 1
try
  let g:unite_source_rec_async_command='ag --nocolor --nogroup -g ""'
  call unite#filters#matcher_default#use(['matcher_fuzzy'])
catch
endtry

" search a file in the filetree
nnoremap <leader>us :split<cr> :<C-u>Unite -start-insert file_rec/async<cr>
" reset not it is <C-l> normally
nnoremap <leader>s<space> <Plug>(unite_restart)

" == NERDTree
"
let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ "Unknown"   : "?"
\ }

noremap <leader>nt :NERDTreeToggle<CR>

" Jump to file in NTFind
nnoremap <silent> <Leader>v :NERDTreeFind<CR>

" Open in tabs
let g:nerdtree_tabs_open_on_console_startup = 0
let g:NERDTreeWinSize=28

" Automatically open when vim opens
autocmd vimenter * NERDTree

" Open when no files are specified on command line
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" Open when a directory is passed as the first argument to vim
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif

" Exit when NERDTree is the only window left open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" auto delete buffer
let NERDTreeAutoDeleteBuffer = 1
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1

" == NERDCommentator
let NERDSpaceDelims=1               " space around delimiters
let NERDRemoveExtraSpaces=1
let g:NERDTreeHijackNetrw = 1
let g:NERDTreeChDirMode = 2
let g:NERDTreeAutoDeleteBuffer = 1
let g:NERDTreeShowBookmarks = 0
let g:NERDTreeCascadeOpenSingleChildDir = 1


" == Syntastic
"
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%{strftime(\"%m/%d/%y\ %H:%M\")}

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

let g:syntastic_php_checkers = ['php', 'phpcs', 'phpmd']
let g:syntastic_aggregate_errors = 1
let g:syntastic_quiet_messages = { "type": "style" }
let g:syntastic_mode_map = {
        \ "mode": "active",
        \ "active_filetypes": ["php"],
        \ "passive_filetypes": [] }

" ----- xolox/vim-easytags settings -----
" Where to look for tags files
set tags=./tags;,~/.vimtags
" Sensible defaults
let g:easytags_events = ['BufReadPost', 'BufWritePost']
let g:easytags_async = 1
let g:easytags_dynamic_files = 2
let g:easytags_resolve_links = 1
let g:easytags_suppress_ctags_warning = 1

" == Rainbow-paren
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

" == SWANK Slimv
let g:slimv_swank_cmd = '! sbcl --load /home/sumosudo/.config/nvim/plugged/slimv/slime/start-swank.lisp'
let g:slimv_swank_cmd = '! sbcl --load ~/.config/nvim/plugged/slimv/slime/start-swank.lisp'
let g:slimv_lisp = '/usr/bin/sbcl'
let g:slimv_keybindings = 2
let g:slimv_impl = 'sbcl'
let g:slimv_repl_simple_eval = 1
let g:slimv_repl_split = 2

"Ultisnip
"
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="aaa"
let g:UltiSnipsJumpForwardTrigger="sss"
let g:UltiSnipsJumpBackwardTrigger="www"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"
let g:UltiSnipsSnippetDirectories=["UltiSnips"]

echo ">^.^<"

" Workspace Setup
" ----------------
function! DefaultWorkspace()
  sp term://zsh
  file Shell\ One
  resize 5
  wincmd k

endfunction
command! -register DefaultWorkspace call DefaultWorkspace()


" Window split settings
highlight TermCursor ctermfg=red guifg=red
highlight ColorColumn ctermfg=red guifg=red
" see terminal edge
if (exists('+colorcolumn'))
        set colorcolumn=80
        highlight ColorColumn ctermbg=9
        call matchadd('ColorColumn', '\%81v', 100)
endif
set splitbelow
set splitright

" Terminal settings
tnoremap <Leader><ESC> <C-\><C-n>

" Window navigation function
" Make ctrl-h/j/k/l move between windows and auto-insert in terminals
func! s:mapMoveToWindowInDirection(direction)
  func! s:maybeInsertMode(direction)
    stopinsert
    execute "wincmd" a:direction

  endfunc

  execute "tnoremap" "<silent>" "<C-" . a:direction . ">"
        \ "<C-\\><C-n>"
        \ ":call <SID>maybeInsertMode(\"" . a:direction . "\")<CR>"
  execute "nnoremap" "<silent>" "<C-" . a:direction . ">"
        \ ":call <SID>maybeInsertMode(\"" . a:direction . "\")<CR>"
endfunc
for dir in ["h", "j", "l", "k"]
  call s:mapMoveToWindowInDirection(dir)
endfor

function! BufSel(pattern)
  let bufcount = bufnr("$")
  let currbufnr = 1
  let nummatches = 0
  let firstmatchingbufnr = 0
  while currbufnr <= bufcount
    if(bufexists(currbufnr))
      let currbufname = bufname(currbufnr)
      if(match(currbufname, a:pattern) > -1)
        echo currbufnr . ": ". bufname(currbufnr)
        let nummatches += 1
        let firstmatchingbufnr = currbufnr
      endif
    endif
    let currbufnr = currbufnr + 1
  endwhile
  if(nummatches == 1)
    execute ":buffer ". firstmatchingbufnr
  elseif(nummatches > 1)
    let desiredbufnr = input("Enter buffer number: ")
    if(strlen(desiredbufnr) != 0)
      execute ":buffer ". desiredbufnr
    endif
  else
    echo "No matching buffers"
  endif
endfunction

"Bind the BufSel() function to a user-command
command! -nargs=1 Bs :call BufSel("<args>")

nnoremap <leader>bb :buffers<cr>:buffer<Space>
