set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" plugins go here

Bundle 'majutsushi/tagbar'
Bundle 'scrooloose/nerdtree'
Bundle 'Valloric/YouCompleteMe'
Plugin 'bling/vim-airline'
Bundle 'nanotech/jellybeans.vim'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" To ignore plugin indent changes, instead use:
" filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

color jellybeans

let g:ycm_global_ycm_extra_conf = "~/.vim/.ycm_extra_conf.py"

" enable airline's smart tabline
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='bubblegum'
"let g:airline_theme='solarized dark'
" Show just the filename
let g:airline#extensions#tabline#fnamemod = ':t'


set nowrap
set number

" copy the indentation from the previous line, when starting a new line
set autoindent

" automatically inserts one extra level of indentation in some cases for C-like files
set cindent

" codeStyle
set tabstop=4
set shiftwidth=4
set expandtab

" silent vim - disable beeping
set vb t_vb=

" this allows buffers to be hidden if you've modified a buffer.
set hidden


nmap <F2> :NERDTreeToggle<CR>
nmap <F3> :bnext<cr>
nmap <F4> :bprevious<cr>

nmap <F8> :TagbarToggle<CR>

