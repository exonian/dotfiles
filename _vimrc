set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'airblade/vim-gitgutter'
Plugin 'ap/vim-buftabline'
Plugin 'nvie/vim-flake8'
Plugin 'rking/ag.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'scy/vim-mkdir-on-write'
Plugin 'simnalamburt/vim-mundo'
Plugin 'sjl/strftimedammit'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-eunuch'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-surround'
Plugin 'Valloric/YouCompleteMe'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ


" ==============================================================================
" Basics
" ------------------------------------------------------------------------------

set hidden
set number

filetype plugin on

" ColorColumn
set cc=120
hi ColorColumn ctermbg=black

" Spacing
set tabstop=4
set shiftwidth=4
set expandtab

" Tab navigation
nnoremap <C-N> :bnext<CR>
nnoremap <C-P> :bprev<CR>

" Resize splits when the window is resized
au VimResized * exe "normal! \<c-w>="

" ipdb breakpoint
nnoremap <leader>d oimport ipdb;ipdb.set_trace()<esc>

" LaTeX
" OPTIONAL: Starting with Vim 7, the filetype of empty .tex files defaults to
" 'plaintex' instead of 'tex', which results in vim-latex not being loaded.
" The following changes the default filetype back to 'tex':
let g:tex_flavor='latex'

" Backups
set backup                        " enable backups
set noswapfile                    " apparently it's 2012 for ghickman, but thanks for this snippet!
set undodir=~/.vim/tmp/undo//     " undo files
set backupdir=~/.vim/tmp/backup// " backups
set directory=~/.vim/tmp/swap//   " swap files

" Make those folders automatically if they don't exist.
if !isdirectory(expand(&undodir))
    call mkdir(expand(&undodir), "p")
endif
if !isdirectory(expand(&backupdir))
    call mkdir(expand(&backupdir), "p")
endif
if !isdirectory(expand(&directory))
    call mkdir(expand(&directory), "p")
endif

" Remove trailing whitespace
nnoremap <leader>W :%s/\s\+$//<cr>:let @/=''<CR>


" ==============================================================================
" Search
" ------------------------------------------------------------------------------

" Case-sensitive search only with caps in search string
set ignorecase
set smartcase

" Match while typing
set hlsearch
set incsearch
set showmatch

" Clear search highlighting.
map <leader><space> :nohls<cr>


" ==============================================================================
" Plugins
" ------------------------------------------------------------------------------

" Ag
if executable("ag")
    set grepprg=ag\ --nogroup\ --nocolor
    nnoremap <leader>a :Ag<space>
endif

" NerdTree
nnoremap <C-L> :NERDTreeToggle<CR>
let NERDTreeIgnore = ['\.pyc$']
