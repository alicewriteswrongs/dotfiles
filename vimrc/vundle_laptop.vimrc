""""""Vundle!

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim' 
Plugin 'mattn/emmet-vim'
Plugin 'tpope/vim-rails'
Plugin 'tpope/vim-rake'
Plugin 'tpope/vim-sensible'
Plugin 'tpope/vim-surround'
Plugin 'majutsushi/tagbar' "press <F10> to get ctags from file
Plugin 'kien/ctrlp.vim' "fuzzy search
Plugin 'tpope/vim-rsi' "gives readline bindings
Plugin 'tpope/vim-commentary' "gc to toggle comments
Plugin 'bling/vim-airline' "pretty stuff! 
Plugin 'terryma/vim-multiple-cursors' "sublime-like cursors
"Plugin 'bling/vim-bufferline' "
Plugin 'edkolev/tmuxline.vim' "makes tmux pretty
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'tpope/vim-vinegar' "makes vim directory browser nicer
Plugin 'vim-scripts/lbdbq' "formats mail headers more nicely
Plugin 'tpope/vim-fugitive' "tpopes git wrapper
Plugin 'tpope/vim-unimpaired' "adds some keybinds?
Plugin 'jceb/vim-orgmode' "fake orgmode!
Plugin 'Rykka/clickable.vim' "clicky links and things!
Plugin 'tpope/vim-speeddating' "easy date formatting
Plugin 'eagletmt/neco-ghc' "haskell thing???
Plugin 'wlangstroth/vim-racket' "some stuff for racket-lang
Plugin 'vim-scripts/paredit.vim' "lisp/racket S-expressions
Plugin 'sjl/tslime.vim' "send text to a tmux pane
Plugin 'reedes/vim-pencil' "soft/hard wraps for txt,md,email
Plugin 'mattn/calendar-vim' "calendar thingy!
Plugin 'haya14busa/incsearch.vim' "nice incremental search
Plugin 'altercation/vim-colors-solarized' "solarized plugin
Plugin 'rust-lang/rust.vim' "some rust stuff
Plugin 'rking/ag.vim' "wrapper for ag
Plugin 'valloric/youcompleteme' "the best completion ever
Plugin 'vim-scripts/Terminus'

call vundle#end()




