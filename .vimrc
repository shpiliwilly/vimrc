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

Bundle 'scrooloose/nerdtree'
Bundle 'scrooloose/syntastic'
Bundle 'Valloric/YouCompleteMe'
Plugin 'bling/vim-airline'
Bundle 'nanotech/jellybeans.vim'
Plugin 'mileszs/ack.vim'


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" Put your non-Plugin stuff after this line


color jellybeans


let g:ycm_global_ycm_extra_conf = "~/.vim/.ycm_extra_conf.py"


" enable airline's smart tabline
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='bubblegum'
"let g:airline_theme='solarized dark'
" Show just the filename
let g:airline#extensions#tabline#fnamemod = ':t'



" close vim if the only window left open is a NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
"open a NERDTree automatcally when vim starts up
"autocmd vimenter * NERDTree


" case insensitive search
set ignorecase
" use case if any caps used
set smartcase 
" show match as search proceeds
set incsearch
" search highlighting
set hlsearch 

" keeps the current visual block selection active after changing indent with '<' or '>'
vnoremap > >gv
vnoremap < <gv

set nowrap
set number
set noswapfile
set cursorline
" codeStyle
set tabstop=4
set shiftwidth=4
set expandtab

" copy the indentation from the previous line, when starting a new line
set autoindent

" automatically inserts one extra level of indentation in some cases for C-like files
set cindent

"silent vim - disable beeping
set vb t_vb=

" Quick Esc
imap jj <ESC>

nmap <F2> :NERDTreeToggle<CR>

" switching buffers
nmap <F3> :bprevious<cr>
nmap <F4> :bnext<cr>

" close buffer without closing the window
:command! BW :bn|:bd#

" this allows buffers to be hidden if you've modified a buffer.
set hidden


