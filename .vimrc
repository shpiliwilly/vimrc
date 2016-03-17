set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" plugins go here

Bundle 'scrooloose/nerdtree'
Bundle 'scrooloose/syntastic'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'ervandew/supertab'
Plugin 'airblade/vim-gitgutter'
Plugin 'tpope/vim-fugitive'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'scrooloose/nerdcommenter'           " Comments
Plugin 'vim-scripts/a.vim'                  " Alternate files
Plugin 'octol/vim-cpp-enhanced-highlight'   " cpp hightlighting
Plugin 'lyuts/vim-rtags'

" Color schemes
Plugin 'flazz/vim-colorschemes'
Plugin 'tomasr/molokai'
Bundle 'nanotech/jellybeans.vim'
Bundle 'vim-scripts/darkburn'

"Plugin 'mileszs/ack.vim'
"Plugin 'Rip-Rip/clang_complete'
"Plugin 'Valloric/YouCompleteMe'  
"Plugin 'vim-scripts/DfrankUtil'
"Plugin 'vim-scripts/Vimprj'
"Plugin 'vim-scripts/indexer.tar.gz'
"Plugin 'vim-scripts/OmniCppComplete'        " cpp completer based on tags
"Plugin 'jistr/vim-nerdtree-tabs'            " Same file list on each tab
"Plugin 'vim-scripts/vim-l9'
"Plugin 'vim-scripts/ShowMarks'
"Plugin 'vim-scripts/cscope.vim'
"Plugin 'git://git.wincent.com/command-t.git'
"Plugin 'git://bitbucket.org/ns9tks/vim-fuzzyfinder.git'
"Plugin 'dhruvasagar/vim-table-mode'
"Plugin 'vim-scripts/project.tar.gz'
"Plugin 'MarcWeber/vim-addon-mw-utils'
"Plugin 'tomtom/tlib_vim'
"Plugin 'garbas/vim-snipmate'
"Plugin 'honza/vim-snippets'
"Plugin 'Xuyuanp/nerdtree-git-plugin'        " Marks git changed files
"Plugin 'sjl/splice.vim'                     " Git mergetool
"Plugin 'vim-scripts/taglist.vim'            " Tag list
"Plugin 'Valloric/ListToggle'                " Toggles location list and quickfix
"Plugin 'chrisbra/Recover.vim'               " diff the diferences when recovering
"Plugin 'git@bitbucket.org:a_romanov/vim-tb.git'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" Put your non-Plugin stuff after this line

"color molokai
color jellybeans
"color darkburn


" rtags navigation
"let g:rtagsUseDefaultMappings = 0
"nnoremap <leader>g :call rtags#JumpTo()<CR>
nnoremap <leader>b <C-o>


" color for current line
hi CursorLine   cterm=NONE ctermbg=DarkBlue ctermfg=white guibg=darkred guifg=white
hi CursorColumn cterm=NONE ctermbg=DarkBlue ctermfg=white guibg=darkred guifg=white
"darkred

" highlight current line only in current window
augroup CursorLine
    au!
    au VimEnter,WinEnter,BufWinEnter * setlocal cursorline
    au WinLeave * setlocal nocursorline
augroup END



let mapleader=" "

" manage buffers/files
nnoremap <Leader>o :CtrlPBuffer<CR>
nnoremap <Leader>i :CtrlPMRU<CR>

" save current buffer
nnoremap <Leader>w :w<CR>

" save all open buffers
nnoremap <Leader>W :wa<CR>

" close buffer without closing the window
:command! BW :bn|:bd#
nnoremap <Leader>q :BW<CR>

" enable airline's smart tabline
"let g:airline#extensions#tabline#enabled = 1
" Show just the filename
"let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline_theme='bubblegum'
"let g:airline_theme='solarized dark'
set laststatus=2
set ttimeoutlen=50


" close vim if the only window left open is a NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
"open a NERDTree automatcally when vim starts up
"autocmd vimenter * NERDTree

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
set tabstop=4
set shiftwidth=4
set expandtab
" copy the indentation from the previous line, when starting a new line
set autoindent
" automatically inserts one extra level of indentation in some cases for C-like files
set cindent
"silent vim - disable beeping
set vb t_vb=
" this allows buffers to be hidden if you've modified a buffer.
set hidden

set textwidth=0
"set colorcolumn=80
"hi ColorColumn ctermbg=darkgrey guibg=darkgrey

" Quick Esc
imap kj <ESC>
" nnoremap ; :

nmap  <Leader>T :NERDTreeToggle<CR>

" switching buffers
"nmap <Leader>h :bprevious<cr>
"nmap <Leader>l :bnext<cr>

" close buffer without closing the window
:command! BW :bn|:bd#

" Easy window navigation
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" Open new split panes to right and bottom
set splitbelow
set splitright


" ShowMarks
"let g:showmarks_textlower="\t>"
"let g:showmarks_include = 'ftc'

" TableMode
let g:table_mode_corner = '-'



" Alternate options
let g:alternateNoDefaultAlternate = 1
let g:alternateSearchPath = 'sfr:../source,sfr:../sources,sfr:../src,'
let g:alternateSearchPath.= 'sfr:../include,sfr:../includes,sfr:../header,sfr:../headers,sfr:../inc,'
let g:alternateSearchPath.= 'sfr:../src,'
let g:alternateSearchPath.= 'reg:#libraries/\([^/]*\)/src#libraries/\1/headers/\1##,'
let g:alternateSearchPath.= 'reg:#libraries/\([^/]*\)/headers/\1#libraries/\1/src##'
inoremap <F4>   <Esc>:A<CR>
nnoremap <F4>   :A<CR>


" automatically open and close the popup menu / preview window
"au CursorMovedI,InsertLeave * if pumvisible() == 0 | silent! pclose | endif
set completeopt=menu,menuone

" opens search results in a window w/ links and highlight the matches
command! -nargs=+ Grp execute 'silent grep! -I -r -n --include=*.h --include=*.hpp --include=*.inl --include=*.cpp --include=*.c . -e <args>' | copen | execute 'silent /<args>'
:nmap <leader>f :Grp  <c-r>=expand("<cword>")<cr><cr>
map <leader>n :cn<CR>
map <leader>p :cp<CR>

map <leader>m :A<CR>

" set pastetoggle=<leader>v

" save and load sessions.
map <leader>S :mksession! ~/.vim_session <cr>
map <leader>L :source ~/.vim_session <cr>


set makeprg=tbmake\ -s\ RECURSIVE=NO\ -j\ 16

