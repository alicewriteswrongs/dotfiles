

zstyle ':completion:*' completer _complete _ignored
zstyle ':completion:*' completions 1
zstyle ':completion:*' menu select
zstyle ':completion:*' glob 1
zstyle ':completion:*' max-errors 5
zstyle ':completion:*' substitute 1
zstyle :compinstall filename '/home/benpote/.zshrc'

setopt AUTO_CD
autoload -Uz compinit promptinit predict-on
compinit
promptinit
# End of lines added by compinstall
# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000000000
SAVEHIST=$HISTSIZE
setopt appendhistory autocd extendedglob nomatch notify
unsetopt beep
bindkey -e
# End of lines configured by zsh-newuser-install

setopt completealiases
autoload -U colors && colors
PROMPT=" %{$fg[blue]%}%n%{$reset_color%} %{$fg[magenta]%}<3 %{$fg_no_bold[yellow]%}%1~ %{$reset_color%}"
#PROMPT="[%{$fg[green]%}%n%{$reset_color%}@%{$fg[blue]%}%m] %{$fg_no_bold[yellow]%}%1~ %{$reset_color%}%# " #old version!
RPROMPT="%{$fg_no_bold[blue]%}%t%{$reset_color%} "
#♥

#git completion
fpath=(~/.zsh $fpath)

#make gnome terminal work correctly?
export TERM=screen-256color-bce

