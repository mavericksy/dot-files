set nocompatible
set nu
set relativenumber
set t_Co=256
set termguicolors
set laststatus=2
set encoding=utf-8
set termencoding=utf-8
set mouse=a

set winwidth=150
set winheight=9
set winminheight=8
set winminwidth=5

set backspace=indent,eol,start
set ruler
set showcmd
set incsearch
set hlsearch

set showmatch
set mat=2

set noequalalways

" --- performance / buffer ---
set hidden                  " can put buffer to the background without writing
"   to disk, will remember history/marks.
set lazyredraw              " don't update the display while executing macros
set ttyfast                 " Send more characters at a given time.

set magic

set completeopt=longest,menuone
set wildmenu                    " make tab completion for files/buffers act like bash
set wildmode=list:full          " show a list when pressing tab and complete
"    first full match
"set wildmode=list:longest,list:full

set nomodeline                  " disable mode lines (security measure)
set cursorline                  " underline the current line, for quick orientation

" --- history / file handling ---
set history=999             " history (default = 20)
set undolevels=999          " Moar undo (default=100)
set autoread                " reload files if changed externally

" --- backup and swap files ---
" I save all the time, those are annoying and unnecessary...
set nobackup
set nowritebackup
set noswapfile

func! DeleteTrailingWS()
  exe "normal mz"
  %s/\s\+$//ge
  exe "normal `z"
endfunc

"Autocommand
autocmd BufWritePre * :call DeleteTrailingWS()
autocmd FocusLost,InsertLeave,BufLeave * :wa
autocmd VimEnter,BufRead,BufNewFile *.asd set filetype=lisp
autocmd VimEnter,BufRead,BufNewFile,WinEnter *.qt set filetype=quicktask
autocmd VimEnter * TagbarToggle

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

" Remember info about open buffers on close
set viminfo^=%

" -----------------------------------------------------------------------------
" INDENTATION AND TEXT-WRAP
" -----------------------------------------------------------------------------

set expandtab                   " Expand tabs to spaces
set autoindent smartindent      " auto/smart indent
set copyindent                  " copy previous indentation on auto indent
set smarttab                    " At start of line, <Tab> inserts shift width
"   spaces, <Bs> deletes shift width spaces.
set expandtab softtabstop=4 shiftwidth=4

set wrap                        " wrap lines
set textwidth=80

set title                " change the terminal's title
set visualbell           " don't beep
set noerrorbells         " don't beep

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
inoremap jk <esc>
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
nnoremap <silent> <leader>epv :e /etc/php.ini<CR>
nnoremap <silent> <leader>spv :! sudo systemctl restart httpd<CR>

" Use the damn hjkl keys
noremap <up> <nop>
noremap <down> <nop>
noremap <left> <nop>
noremap <right> <nop>

" Easy movement over wrapped lines
nnoremap j gj
nnoremap k gk

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

" see terminal edge
if (exists('+colorcolumn'))
  set colorcolumn=80
  highlight ColorColumn ctermbg=9
endif

" auto-install vim-plug
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs \
  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall
endif

" == Plugins ==
"
filetype off

syntax off

call plug#begin('~/.config/nvim/plugged')

Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'fmoralesc/vim-pad'
Plug 'altercation/vim-colors-solarized'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'scrooloose/syntastic'
Plug 'xolox/vim-misc'
Plug 'xolox/vim-easytags'
Plug 'vim-scripts/a.vim'
Plug 'flazz/vim-colorschemes'
Plug 'Raimondi/delimitMate'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'kien/rainbow_parentheses.vim'
Plug 'altercation/vim-colors-solarized'
Plug 'Shougo/vimproc.vim', {'do' : 'make'}
Plug 'Shougo/unite.vim'
Plug 'kovisoft/slimv'
Plug 'tpope/vim-classpath'
" Track the engine.
Plug 'SirVer/ultisnips'
" Snippets are separated from the engine. Add this if you want them:
Plug 'honza/vim-snippets'
" Trinity for SourceExpl
Plug 'guns/vim-sexp'
Plug 'tpope/vim-sexp-mappings-for-regular-people'
Plug 'tpope/vim-surround'
Plug 'godlygeek/tabular'
Plug 'sukima/xmledit'
Plug 'aaronbieber/vim-quicktask'
Plug 'rayburgemeestre/phpfolding.vim'
Plug 'joonty/vdebug'
Plug 'tobyS/pdv'
Plug 'tobyS/vmustache'
Plug 'phpmd/phpmd'
Plug 'tpope/vim-dispatch'
Plug 'mhinz/vim-grepper', { 'on': ['Grepper', '<plug>(GrepperOperator)'] }
Plug 'mhinz/vim-signify'
Plug 'janko-m/vim-test'
Plug 'brooth/far.vim'
Plug 'easymotion/vim-easymotion'
Plug 'vimoutliner/vimoutliner'
Plug 'lvht/phpcd.vim', { 'for': 'php', 'do': 'composer install' }
Plug 'vim-scripts/taglist.vim'
Plug 'terryma/vim-multiple-cursors'
Plug 'vim-scripts/BufOnly.vim'
Plug 'ludovicchabant/vim-lawrencium'

call plug#end()

filetype indent plugin on

syntax on

" TagList
let Tlist_Use_Right_Window = 1
let Tlist_WinWidth = 20

" PHPCD
"let g:deoplete#ignore_sources = get(g:, 'deoplete#ignore_sources', {})
let g:deoplete#ignore_sources.php = ['omni']

"QuickTask
let g:quicktask_autosave = 1

"Deoplete
let g:deoplete#enable_at_startup = 1
let g:deoplete#auto_complete_start_length = 1
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
