syntax on " for new Vim 7.4
" My additions
set nu! "нумерация
set ai! "автоотступы
set cindent "отступы после скобок
set nocompatible "убрать совместимость с vi
set hls "подсвечивть поиск - не работает?
set mouse=a "поддержка мыши
set autochdir "автозаход в папку открытого файла
set cursorline          " Подсветка строки, в которой находится в данный момент курсор
set t_Co=256            " Кол-во цветов
set splitbelow          " новый сплит будет ниже текущего :sp
set splitright          " новый сплит будет правее текущего :vsp
set shortmess+=I        " не показывать intro screen
set incsearch   " При поиске перескакивать на найденный текст в процессе набора строки
set ignorecase  " Игнорировать регистр букв при поиске
set smartcase   " Override the 'ignorecase' if the search pattern contains upper case characters

set smartindent
set tabstop=4
set shiftwidth=4
set expandtab

" Бэкап и свап
set nobackup
set nowritebackup
set noswapfile
"Строк под курсором при прокрутке
set scrolloff=5

" Show a vertical line on a 80th character
set textwidth=100
set colorcolumn=+1
highlight ColorColumn ctermbg=DarkGrey

" Автозакрытие скобок и кавычек
imap [ []<LEFT>
imap ( ()<LEFT>
imap { {}<LEFT>
inoremap " ""<Left>
inoremap ' ''<Left>

" VUNDLE

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" General
Plugin 'kien/ctrlp.vim'
Plugin 'scrooloose/syntastic.git'
Plugin 'https://github.com/bling/vim-airline.git'
Plugin 'git://github.com/scrooloose/nerdtree.git'
Plugin 'git://github.com/scrooloose/nerdcommenter.git'
Plugin 'https://github.com/Shougo/neocomplcache.vim.git'
Plugin 'git://github.com/altercation/vim-colors-solarized.git'

Bundle 'git://github.com/godlygeek/tabular.git'
Bundle 'tpope/vim-surround'

" Snippets
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'garbas/vim-snipmate'
Plugin 'honza/vim-snippets'

" HTML/CSS
Bundle 'git://github.com/othree/html5.vim.git'
Bundle 'git://github.com/gregsexton/MatchTag.git'
Bundle 'git://github.com/hail2u/vim-css3-syntax.git'
Bundle 'git://github.com/ap/vim-css-color.git'
Bundle 'git://github.com/groenewege/vim-less.git'
Bundle 'git://github.com/hokaccha/vim-html5validator.git'
Bundle 'mattn/emmet-vim'

" JS
Bundle 'git://github.com/pangloss/vim-javascript.git'
" Bundle 'marijnh/tern_for_vim'
Bundle 'git://github.com/itspriddle/vim-jquery.git'
Bundle 'git://github.com/heavenshell/vim-jsdoc.git'

" PHP
Bundle 'git://github.com/2072/PHP-Indenting-for-VIm.git'
Bundle 'git://github.com/brookhong/DBGPavim.git'

" Docs
Bundle 'mikehaertl/yii-api-vim'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" END OF VUNDLE

" Debug
let g:dbgPavimPort = 9009
let g:dbgPavimBreakAtEntry = 0

let php_sql_query=1
let php_htmlInStrings=1

" NeoComplCache
let g:neocomplcache_enable_at_startup = 1
let g:neocomplcache_enable_smart_case = 1
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_enable_auto_select = 1
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType php setlocal omnifunc=phpcomplete#CompletePHP
if !exists('g:neocomplcache_omni_patterns')
  let g:neocomplcache_omni_patterns = {}
endif
let g:neocomplcache_omni_patterns.php = '[^. \t]->\h\w*\|\h\w*::'

" Syntastic
let g:syntastic_enable_signs=1
let g:syntastic_javascript_checkers = ['jshint']
" End of Syntastic

" Mappings
" Tabular
let mapleader=','
if exists(":Tabularize")
  nmap <Leader>= :Tab /=<CR>
  vmap <Leader>= :Tab /=<CR>
  nmap <Leader>: :Tab /:\zs<CR>
  vmap <Leader>: :Tab /:\zs<CR>
endif

" NERDtree plugin
nmap <Leader>nt :NERDTreeToggle<cr>
vmap <Leader>nt <esc>:NERDTreeToggle<cr>

" Settings

" CtrlP
let g:ctrlp_working_path_mode = 'r'

" История между сессиями
if version >= 703
    set history=64
    set undolevels=128
    set undodir=~/.vim/undodir/
    set undofile
    set undolevels=1000
    set undoreload=10000
endif


" Airline
let g:airline_left_sep = ''
let g:airline_right_sep = ''
let g:airline_enable_syntastic=1

colorscheme solarized
