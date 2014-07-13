typeset -U path
path=(~/.vim-anywhere/bin ~/Code/shellscripts ~/.gem/ruby/2.1.0/bin $path)

stty stop undef

#sup related ruby GC stuff
export RUBY_GC_MALLOC_LIMIT=256000000
export RUBY_GC_HEAD_INIT_SLOTS=600000
export RUBY_HEAP_SLOTS_INCREMENT=200000
export RUBY_HEAP_FREE_MIN=100000

#colored terminal output!
export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced

#autocomplete for git
source ~/.git-completion.bash

#export Vim as my default editor
export EDITOR="vim"



