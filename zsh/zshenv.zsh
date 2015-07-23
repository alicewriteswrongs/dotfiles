typeset -U path
path=(~/.vim-anywhere/bin ~/bin ~/Code/shellscripts ~/.gem/ruby/2.1.0/bin ~/.gem/ruby/2.2.0/bin ~/.cabal/bin ~/Code/ms/msdir $path)

stty stop undef

#sup related ruby GC stuff
export RUBY_GC_MALLOC_LIMIT=256000000
export RUBY_GC_HEAD_INIT_SLOTS=600000
export RUBY_HEAP_SLOTS_INCREMENT=200000
export RUBY_HEAP_FREE_MIN=100000

#colored terminal output!
export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced

#export Vim as my default editor
export EDITOR="vim"

#background environmental variable
export BACKGROUND="/home/alice/images/tarsands.jpg"
