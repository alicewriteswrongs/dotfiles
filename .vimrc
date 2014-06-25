""""""""VIMRC""""""""""
"""Ben Pote
"""Last updated 5.28.14

"""""""""""""""""""""""

""""""Vundle!

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

"""plugins!
" let Vundle manage Vundle, required
Plugin 'gmarik/vundle'
Plugin 'tpope/vim-sensible'
Plugin 'ervandew/supertab'
Plugin 'chrisbra/histwin.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'ivanov/vim-ipython'
Plugin 'majutsushi/tagbar'
Plugin 'kien/ctrlp.vim'
Plugin 'mrtazz/simplenote.vim'
Plugin 'tpope/vim-rsi'
Plugin 'tpope/vim-commentary'
Plugin 'bling/vim-airline'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'jpalardy/vim-slime'
Plugin 'bling/vim-bufferline'
Plugin 'tpope/vim-vinegar'
Plugin 'vim-scripts/lbdbq'
Plugin 'godlygeek/tabular'
Plugin 'tpope/vim-fugitive'
Plugin 'justinmk/vim-sneak'
Plugin 'chrisbra/DistractFree'
"Plugin 'klen/python-mode'
"Plugin 'mikewest/vimroom'




""""sections:
""""GEN CONFIG
""""PLUGIN CONFIG
""""KEYBINDS

"""""""GEN CONFIG"""""""

"mostly config of builtins, colorscheme, etc

filetype plugin indent on "filetype based indenting 
syntax enable "syntax highlighting
set relativenumber 
set wildmenu "better command line completion
set hlsearch "highlight searches
set number "line numbers
set background=dark "stuff for solarized colorscheme
colorscheme solarized "solarized colorscheme (so tasty)
"let g:solarized_termcolors=256 "necessary for terminal vim under mac os
set modeline " autoindentation
""""python friendliness
set tabstop=8 "insert 4 spaces for tab (python standard)
set shiftwidth=4 "block indent/unindent
set expandtab "insert spaces instead of tabs
set softtabstop=4 "still have delete remove 1 tab worth of spaces
set autoindent "newline matches indentation level of line above
set spelllang=en_us "spellcheck is in US english
set grepprg=grep\ -nH\ $*
set foldmethod=syntax
"mouse
set ttyfast
set mouse=a
set mousemodel=extend

""""""FUNCTIONS""""""""""""

   

""""""PLUGIN CONFIG""""""""

"crtlp
let g:ctrlp_extensions = ['buffertag']

"Simplenote.vim
source ~/.simplenoterc
let g:SimplenoteListHeight=55
let g:SimplenoteVertical=0
let g:SimplenoteFiletype='markdown'

"vim-latexsuite
let g:Tex_DefaultTargetFormat='pdf'
let g:tex_flavor='latex'

"vim-airline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#whitespace#enabled = 1

"vim-slime
let g:slime_target = "tmux"



""""""KEYBINDS""""""""

"set leader to space
let mapleader = "\<Space>"

"toggle search highlighting on/off
let hlstate=0
nnoremap <F4> :if (hlstate == 0) \| nohlsearch \| else \| set hlsearch \| endif \| let hlstate=1-hlstate<cr>

"common commands
nnoremap <Leader>w :w<cr>
nnoremap <Leader>q :q<cr>
nnoremap <Leader>sp :setlocal spell<cr> 
vmap <Leader>y "+y
vmap <Leader>d "+d
nmap <Leader>p "+p
nmap <Leader>P "+P
vmap <Leader>p "+p
vmap <Leader>P "+P

"buffers!
nnoremap <Leader>bl :buffers<cr>
nnoremap <Leader>b1 :buffer1<cr>
nnoremap <Leader>b2 :buffer2<cr>
nnoremap <Leader>b3 :buffer3<cr>
nnoremap <Leader>b4 :buffer4<cr>
nnoremap <Leader>b5 :buffer5<cr>
nnoremap <Leader>b6 :buffer6<cr>
nnoremap <Leader>b7 :buffer7<cr>
nnoremap <Leader>bn :bnext<cr>
nnoremap <Leader>bp :bprev<cr>
nnoremap <Leader>t  :enew<cr>
nnoremap <Leader>bq :bd<cr>

"splits!
nnoremap <Leader>o :vsplit<cr>
nnoremap <Leader>u :split<cr>
nnoremap <Leader>j <C-W>w
nnoremap <Leader>k <C-W>W

"nerdtree
nnoremap <F2> :NERDTreeToggle<cr> 

"tagbar
nnoremap <F10> :TagbarToggle<cr> 
nnoremap <F8> :TagbarOpen [fj]<cr> 

"simplenote
nnoremap <Leader>sn :Simplenote -n<cr> 
nnoremap <Leader>sl :Simplenote -l<cr>

"histwin
nnoremap <Leader>ub :UB<cr>

"vim-ipython (note that you need to have a .py open)
nnoremap <Leader>ip :IPython<cr>

"open .vimrc
nnoremap <Leader>vrc :e ~/Code/dotfiles/.vimrc<cr>

"crtlp
nnoremap <Leader>p :CtrlPBufTag<cr>
nnoremap <Leader>P :CtrlPMRU<cr>
