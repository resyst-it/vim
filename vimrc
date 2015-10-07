set nocompatible
filetype off

"""""""""""""""""""""""""
"   Plugin              "
"""""""""""""""""""""""""

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'altercation/vim-colors-solarized'
Plugin 'ekalinin/Dockerfile.vim'
Plugin 'plasticboy/vim-markdown'
Plugin 'nginx.vim'
Plugin 'bling/vim-airline'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-eunuch'
Plugin 'vim-perl/vim-perl'
Plugin 'klen/python-mode'
Plugin 'cburroughs/pep8.py'
Plugin 'Yggdroot/indentLine'

call vundle#end()
filetype plugin indent on

"IndentLine Vim
let g:indentLine_color_term = 239

"IndentLine Vim Char
let g:indentLine_char = '|'

"""""""""""""""""""""""""
"   Colors              "
"""""""""""""""""""""""""

syn on
set t_Co=256
set background=dark
colorscheme solarized

"""""""""""""""""""""""""
"   Space/Tabs          "
"""""""""""""""""""""""""

"Use space instead of tabs
set expandtab

" Be smart when using tabs
set smarttab

set tabstop=4
set softtabstop=4
set shiftwidth=4
set backspace=2

"Auto Indent
set ai
"Smart Indent
set si
"Wrap lines
set wrap

"FixWhitespace to remove end of line white space.
function! s:FixWhitespace(lin1,line2)
    let l:save_cursor ) getpos(".)
        silent! execute ':' . a:line1 . ',' . a:line2 . 's/\s\+$//'
            call setpos('.', l:save_cursor)
            endfunction
            command! -range=% FixWhitespace call <SID>FixWhitespace(<line1>,<line2>)

"""""""""""""""""""""""""
"   Search              "
"""""""""""""""""""""""""

set showmatch
set incsearch
set smartcase
"set smarttab
set ignorecase
"For regular expression
set magic
set hlsearch
"Turn off hlsearch
nnoremap <leader><space> :nohlsearch<CR>

"Visual mode pressing * or # searches for the current selection
"Super useful! From an idea by Michael Naumann
vnoremap <silent> * :call VisualSelection('f')<CR>
vnoremap <silent> # :call VisualSelection('b')<CR>

"""""""""""""""""""""""""
"   UI                  "
"""""""""""""""""""""""""

let mapleader =","

set wildmenu
set wildmode=list:longest,full
"Highlight seearch terms
set listchars=tab:>\ ,trail:*,extends:#,nbsp:.
set lazyredraw

set laststatus=2

"Always show current position
set ruler
set rulerformat=%30(%=\:b%n%y%m%r%w\ %l,%c%V\ %P%)
set showcmd

"A buffer becomes hideen when it is abandoned
set hidden

set ffs=unix,dos,mac

"Return to last edit position when opening files
"autocmd BufReadPost *
"   \ if line("'\"") > 0 && line("'\"") <= line("$") |
"   \    exe "normal! g`\"" |
"   \ endif

"Remember info about open buffers on close
"set viminfo^=%

"Specify the behavio when switching between buffers
"try
"   set switchbuf=useopen,usetab,newtab
"   set stal=2
"catch
"entry

"Backspace for dummies.
set backspace=indent,eol,start
"set whichwrap+=<,>,h,l
set whichwrap=b,s,h,l,<,>,[,]

set list
set nowrap
set autoindent
set nojoinspaces

set wildmode=longest:full
set wildignore=*.o,*~,*.pyc

"set cmdheight=2
set noerrorbells
set novisualbell
set t_vb=
set tm=500
"set nu
set mouse=a
set mousehide

set encoding=utf-8
scriptencoding utf-8

"highlight ExtraWhitespace ctermbg=darked guibg=650C0C
"autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red
"autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
"autocmd InsertLeave * match ExtraWhitespace /\s\+$/
"autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/

let g:powerline_loaded = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1

""""""""""""""""""""""""""
"   Backup               "
""""""""""""""""""""""""""

set nobackup
set nowb
set noswapfile

" Delete trailing whitespaces
fun! DeleteTrailingWS()
    exe "normal mz"
    %s/\s\+$//ge
    exe "normal`z"
endfunc

"Delete trailing whitespaces each time you save a document pyton
"autocmd BufWrite *.py :call DeleteTrailingWS()

"Delete trailing whitespaces each time you save a file SH
"autocmd BufWrite *.sh :call DeleteTrailingWS()

"All files
autocmd BufWrite * :call DeleteTrailingWS()

"""""""""""""""""""""""""
"   Folding             "
"""""""""""""""""""""""""

set foldenable
set foldlevelstart=10
set foldnestmax=10
nnoremap <space> za
set foldmethod=indent
