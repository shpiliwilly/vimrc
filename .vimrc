set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" plugins go here

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
Bundle 'nanotech/jellybeans.vim'
Bundle 'vim-scripts/darkburn'

" TODO. explore hose plugins
"Plugin 'Rip-Rip/clang_complete'             " code completion
"Plugin 'scrooloose/syntastic'
"Plugin 'mileszs/ack.vim'
"Plugin 'vim-scripts/DfrankUtil'
"Plugin 'vim-scripts/Vimprj'
"Plugin 'vim-scripts/indexer.tar.gz'
"Plugin 'vim-scripts/OmniCppComplete'        " cpp completer based on tags
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
"Plugin 'sjl/splice.vim'                     " Git mergetool
"Plugin 'vim-scripts/taglist.vim'            " Tag list
"Plugin 'Valloric/ListToggle'                " Toggles location list and quickfix
"Plugin 'chrisbra/Recover.vim'               " diff the diferences when recovering
"Plugin 'git@bitbucket.org:a_romanov/vim-tb.git'
"Plugin 'tomasr/molokai'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" Put your non-Plugin stuff after this line

"color molokai
"color darkburn
color jellybeans


" rtags navigation
"let g:rtagsUseDefaultMappings = 0
"nnoremap <leader>g :call rtags#JumpTo()<CR>
nnoremap <leader>b <C-o>


" highlight current line only in current window
augroup CursorLine
    au!
    au VimEnter,WinEnter,BufWinEnter * setlocal cursorline
    au WinLeave * setlocal nocursorline
augroup END

" color for cursor and current line
function s:SetCursorLine()
    set cursorline
    hi cursorline cterm=none ctermbg=darkblue ctermfg=white guibg=darkred guifg=white
endfunction
autocmd VimEnter * call s:SetCursorLine()


let mapleader=" "

" manage buffers/files
nmap <Leader>i :CtrlPMRU<CR>
nmap <Leader>o :CtrlPBuffer<CR>

" save current buffer
nmap <Leader>w :w<CR>
" save all open buffers
nmap <Leader>W :wa<CR>

" close buffer without closing the window
:command! BW :bn|:bd#
nmap <Leader>q :BW<CR>


let g:airline_theme='bubblegum'
let g:airline#extensions#branch#enabled = 0
let g:airline#extensions#whitespace#checks = [ 'indent', 'mixed-indent-file' ]
let g:airline_section_y = ''
let g:airline_section_x = ''

let g:syntastic_always_populate_loc_list=0
let g:syntastic_cpp_compiler="gcc"
let g:syntastic_cpp_compiler_options="-std=c++11 -stdlib=libc++"


set laststatus=2
set ttimeoutlen=50

" case insensitive search
set ignorecase
" use case if any caps used
set smartcase
" show match as search proceeds
set incsearch
" search highlighting
set hlsearch

highlight Search ctermfg=black cterm=none guibg=lightyellow ctermbg=yellow


" keeps the current visual block selection active after changing indent with '<' or '>'
vnoremap > >gv
vnoremap < <gv
set nowrap
set number
set noswapfile
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

" Open new split panes to right and bottom
set splitbelow
set splitright

" complete options (disable preview scratch window)
set completeopt=menu,menuone,longest
" Limit popup menu height
set pumheight=15


" Quick Esc
imap kj <ESC>
" nnoremap ; :

" Easy window navigation
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

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

" opens search results in a window w/ links and highlight the matches
command! -nargs=+ Grp execute 'silent grep! -I -r -n --include=*.h --include=*.hpp --include=*.inl --include=*.cpp --include=*.c . -e <args>' | copen | execute 'silent /<args>'
:nmap <leader>f :Grp  <c-r>=expand("<cword>")<cr><cr>
nmap <leader>n :cn<CR>
nmap <leader>p :cp<CR>

nmap <leader>m :A<CR>

" switch to previous file. Fast way to toggle between two files
nmap <leader>z <C-^>

" save and load sessions.
nmap <leader>S :mksession! ~/.vim_session <cr>
nmap <leader>L :source ~/.vim_session <cr>
