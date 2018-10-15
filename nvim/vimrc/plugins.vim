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

""""""""""""""
"  DEFAULTS  "
""""""""""""""
Plug 'https://github.com/tpope/vim-sensible.git'
Plug 'xolox/vim-misc'
Plug 'vim-scripts/a.vim'
Plug 'Shougo/vimproc.vim', {'do' : 'make'}
Plug 'tpope/vim-classpath'
Plug 'tpope/vim-dispatch'
Plug 'mhinz/vim-signify'

""""""""""""
"  MIRRIR  "
""""""""""""
Plug 'zenbro/mirror.vim'
"
"""""""""
"  PHP  "
"""""""""
Plug 'StanAngeloff/php.vim', {'for': 'php'}
Plug 'Rican7/php-doc-modded'
Plug 'adoy/vim-php-refactoring-toolbox'
Plug 'stephpy/vim-php-cs-fixer'
Plug 'phpactor/phpactor' ,  {'do': 'composer install', 'for': 'php'}
Plug 'rayburgemeestre/phpfolding.vim'
Plug 'phpmd/phpmd'
Plug 'lvht/phpcd.vim', { 'for': 'php', 'do': 'composer install' }

""""""""""""""
"  DEOPLETE  "
""""""""""""""
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'zchee/deoplete-jedi'
Plug 'zchee/deoplete-zsh'
Plug 'kristijanhusak/deoplete-phpactor'
Plug 'zchee/deoplete-clang'

"""""""""
"  LSP  "
"""""""""
"Plug 'autozimu/LanguageClient-neovim', { 'do': ':UpdateRemotePlugins' }
"Plug 'roxma/LanguageServer-php-neovim',  {'do': 'composer install && composer run-script parse-stubs', 'for': 'php'}

"""""""""""
"  LATEX  "
"""""""""""
Plug 'vim-latex/vim-latex'


""""""""
"  JS  "
""""""""
Plug 'pangloss/vim-javascript'
Plug 'jelera/vim-javascript-syntax'
Plug 'ternjs/tern_for_vim', { 'for': ['javascript', 'javascript.jsx'] }
Plug 'carlitux/deoplete-ternjs', { 'for': ['javascript', 'javascript.jsx'] }
Plug 'othree/jspc.vim', { 'for': ['javascript', 'javascript.jsx'] }

""""""""""
"  HTML  "
""""""""""
Plug 'hail2u/vim-css3-syntax'
Plug 'gorodinskiy/vim-coloresque'
Plug 'tpope/vim-haml'
Plug 'mattn/emmet-vim'

""""""""""
"  MAKE  "
""""""""""
Plug 'neomake/neomake'

"""""""""""""
"  PROJECT  "
"""""""""""""
Plug 'mhinz/vim-startify'

"""""""""""""""
"  SAVE UNDO  "
"""""""""""""""
Plug 'bfredl/nvim-miniyank'
Plug 'sjl/gundo.vim'

"""""""""""
"  NOTES  "
"""""""""""
Plug 'fmoralesc/vim-pad'
Plug 'aaronbieber/vim-quicktask'
Plug 'vimoutliner/vimoutliner'

""""""""""""
"  THEMES  "
""""""""""""
Plug 'altercation/vim-colors-solarized'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'flazz/vim-colorschemes'
Plug 'altercation/vim-colors-solarized'

""""""""""
"  NERD  "
""""""""""
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/nerdcommenter'
Plug 'jistr/vim-nerdtree-tabs'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'f4t-t0ny/nerdtree-hg-plugin'


Plug 'xolox/vim-misc'
Plug 'xolox/vim-easytags'
Plug 'vim-scripts/a.vim'
Plug 'flazz/vim-colorschemes'
Plug 'Raimondi/delimitMate'
"""""""""""""
"  BUFFERS  "
"""""""""""""
Plug 'moll/vim-bbye'
Plug 'vim-scripts/BufOnly.vim'

""""""""""
"  TAGS  "
""""""""""
Plug 'ludovicchabant/vim-gutentags'
Plug 'majutsushi/tagbar'

"""""""""
"  GIT  "
"""""""""
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'jreybert/vimagit'
Plug 'kien/rainbow_parentheses.vim'
Plug 'altercation/vim-colors-solarized'
Plug 'Shougo/vimproc.vim', {'do' : 'make'}
Plug 'Shougo/unite.vim'
"""""""""""""""
"  MERCURIAL  "
"""""""""""""""
Plug 'ludovicchabant/vim-lawrencium'
Plug 'jlfwong/vim-mercenary'

""""""""""
"  LISP  "
""""""""""
Plug 'kovisoft/slimv'
Plug 'tpope/vim-classpath'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'guns/vim-sexp'
Plug 'tpope/vim-sexp-mappings-for-regular-people'

""""""""""""
"  SYNTAX  "
""""""""""""
Plug 'scrooloose/syntastic'
Plug 'Raimondi/delimitMate'
Plug 'kien/rainbow_parentheses.vim'
Plug 'tpope/vim-surround'
Plug 'godlygeek/tabular'

""""""""""""""
"  SNIPPETS  "
""""""""""""""
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

""""""""""
"  JSON  "
""""""""""

"""""""""
"  XML  "
"""""""""
Plug 'sukima/xmledit'
Plug 'aaronbieber/vim-quicktask'
Plug 'rayburgemeestre/phpfolding.vim'
""""""""""""
"  SEARCH  "
""""""""""""
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'wesleyche/SrcExpl'
Plug 'easymotion/vim-easymotion'
Plug 'brooth/far.vim'
Plug 'mhinz/vim-grepper', { 'on': ['Grepper', '<plug>(GrepperOperator)'] }

""""""""""""
"  PYTHON  "
""""""""""""
Plug 'neovim/python-client'
Plug 'python-mode/python-mode'
Plug 'joonty/vdebug'
Plug 'tobyS/pdv'
Plug 'mustache/vim-mustache-handlebars'
Plug 'phpmd/phpmd'
Plug 'tpope/vim-dispatch'
Plug 'mhinz/vim-grepper', { 'on': ['Grepper', '<plug>(GrepperOperator)'] }
Plug 'mhinz/vim-signify'
Plug 'janko-m/vim-test'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'brooth/far.vim'
Plug 'easymotion/vim-easymotion'
Plug 'vimoutliner/vimoutliner'
Plug 'terryma/vim-multiple-cursors'
Plug 'vim-scripts/BufOnly.vim'
Plug 'ludovicchabant/vim-lawrencium'
Plug 'jremmen/vim-ripgrep'
Plug 'christoomey/vim-tmux-navigator'

"""""""
"  C  "
"""""""
Plug 'vim-scripts/c.vim'
Plug 'vim-scripts/Conque-GDB'

""""""""""""""
"  PLANTUML  "
""""""""""""""
Plug 'weirongxu/plantuml-previewer.vim'
Plug 'aklt/plantuml-syntax'
Plug 'tyru/open-browser.vim'

call plug#end()

filetype indent plugin on
syntax on
