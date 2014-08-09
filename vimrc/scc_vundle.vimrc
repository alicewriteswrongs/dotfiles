""""""Vundle!

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

"""plugins!
" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle'
Plugin 'tpope/vim-sensible'
Plugin 'ervandew/supertab'
"Plugin 'chrisbra/histwin.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'majutsushi/tagbar'
Plugin 'kien/ctrlp.vim'
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
Plugin 'tpope/vim-unimpaired'
Plugin 'benmills/vimux'
Plugin 'julienr/vimux-pyutils'
"Plugin 'klen/python-mode'
"Plugin 'mikewest/vimroom'

call vundle#end()


