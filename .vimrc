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
Plugin 'bling/vim-airline'
Bundle 'nanotech/jellybeans.vim'
Bundle 'vim-scripts/darkburn'
Plugin 'mileszs/ack.vim'
Plugin 'Rip-Rip/clang_complete'
Plugin 'ervandew/supertab'
Plugin 'airblade/vim-gitgutter'
Plugin 'tpope/vim-fugitive'
Plugin 'kien/ctrlp.vim'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" Put your non-Plugin stuff after this line

"color jellybeans
color darkburn


let mapleader=" "

" open new file
nnoremap <Leader>o :CtrlP<CR>

" save current buffer
nnoremap <Leader>w :w<CR>

" save all open buffers
nnoremap <Leader>W :wa<CR>

" close buffer without closing the window
:command! BW :bn|:bd#
nnoremap <Leader>q :BW<CR>




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



" complete options (disable preview scratch window)
set completeopt=menu,menuone,longest
" Limit popup menu height
set pumheight=15
" Clang Complete Settings
let g:clang_use_library=1



" If equal to 1, open quickfix window on error.
let g:clang_complete_copen=1
" If clang should complete preprocessor macros and constants.
let g:clang_complete_macros=1
" Additionnal compilation argument passed to libclang.
"let g:clang_user_options=' -std=c++11 || exit 0'

" 0 will make you arrow down to select the first option, 
" 1 will select the first option for you, but won't insert it unless you press enter. 
" 2 will automatically insert what it thinks is right. 
let g:clang_auto_select=1


let g:syntastic_always_populate_loc_list=0
let g:syntastic_cpp_compiler="gcc"
let g:syntastic_cpp_compiler_options="-std=c++11 -stdlib=libc++"


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
imap kj <ESC>
nnoremap ; :

nmap <F2> :NERDTreeToggle<CR>

" switching buffers
nmap <F3> :bprevious<cr>
nmap <F4> :bnext<cr>

" close buffer without closing the window
:command! BW :bn|:bd#

" this allows buffers to be hidden if you've modified a buffer.
set hidden


