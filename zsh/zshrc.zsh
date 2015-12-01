source ~/dotfiles/zsh/antigen/antigen.zsh

zstyle ':completion:*' completer _complete _ignored
zstyle ':completion:*' completions 1
zstyle ':completion:*' menu select
zstyle ':completion:*' glob 1
zstyle ':completion:*' max-errors 5
zstyle ':completion:*' substitute 1
zstyle :compinstall filename '/home/alice/.zshrc'

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
bindkey -v
# End of lines configured by zsh-newuser-install

setopt completealiases
autoload -U colors && colors

setopt prompt_subst
. ~/dotfiles/zsh/script/git-prompt.sh

## MY PROMPT
## looks like alice <3 dir         current_time
PROMPT=" %{$fg[blue]%}%n%{$reset_color%} %{$fg[magenta]%}<3 %{$fg_no_bold[yellow]%}%1~ %{$reset_color%}"
#PROMPT="[%{$fg[green]%}%n%{$reset_color%}@%{$fg[blue]%}%m] %{$fg_no_bold[yellow]%}%1~ %{$reset_color%}%# " #old version!
RPROMPT=$'%{$fg_no_bold[yellow]%}$(__git_ps1 "%s") %{$fg_no_bold[blue]%}%T%{$reset_color%}'
#♥

eval `dircolors ~/dotfiles/zsh/dir_colors`

#make gnome terminal work correctly?
export TERM=screen-256color-bce

chpwd() {
    ls -lrthG
}

source ~/dotfiles/zsh/aliases.zsh
source ~/dotfiles/zsh/functions.zsh

typeset -A key

key[Home]=${terminfo[khome]}

key[End]=${terminfo[kend]}
key[Insert]=${terminfo[kich1]}
key[Delete]=${terminfo[kdch1]}
key[Up]=${terminfo[kcuu1]}
key[Down]=${terminfo[kcud1]}
key[Left]=${terminfo[kcub1]}
key[Right]=${terminfo[kcuf1]}
key[PageUp]=${terminfo[kpp]}
key[PageDown]=${terminfo[knp]}

# setup key accordingly
[[ -n "${key[Home]}"     ]]  && bindkey  "${key[Home]}"     beginning-of-line
[[ -n "${key[End]}"      ]]  && bindkey  "${key[End]}"      end-of-line
[[ -n "${key[Insert]}"   ]]  && bindkey  "${key[Insert]}"   overwrite-mode
[[ -n "${key[Delete]}"   ]]  && bindkey  "${key[Delete]}"   delete-char
[[ -n "${key[Up]}"       ]]  && bindkey  "${key[Up]}"       up-line-or-history
[[ -n "${key[Down]}"     ]]  && bindkey  "${key[Down]}"     down-line-or-history
[[ -n "${key[Left]}"     ]]  && bindkey  "${key[Left]}"     backward-char
[[ -n "${key[Right]}"    ]]  && bindkey  "${key[Right]}"    forward-char
#[[ -n "${key[PageUp]}"   ]]  && bindkey  "${key[PageUp]}"   beginning-of-buffer-or-history
#[[ -n "${key[PageDown]}" ]]  && bindkey  "${key[PageDown]}" end-of-buffer-or-history

[[ -n "${key[PageUp]}"   ]]  && bindkey  "${key[PageUp]}"   history-beginning-search-backward
[[ -n "${key[PageDown]}" ]]  && bindkey  "${key[PageDown]}" history-beginning-search-forward

# Finally, make sure the terminal is in application mode, when zle is
# active. Only then are the values from $terminfo valid.
if (( ${+terminfo[smkx]} )) && (( ${+terminfo[rmkx]} )); then
    function zle-line-init () {
        printf '%s' "${terminfo[smkx]}"
    }
    function zle-line-finish () {
        printf '%s' "${terminfo[rmkx]}"
    }
    zle -N zle-line-init
    zle -N zle-line-finish
fi

[ -f ~/dotfiles/zsh/fzf.zsh ] && source ~/dotfiles/zsh/fzf.zsh
export GOPATH="$HOME/Code/gospace"
export PATH="$PATH:$GOPATH/bin"
export PATH="$HOME/root/bin:$PATH" # for user libs
export PATH="$HOME/.rvm/bin:$PATH" # Add RVM to PATH for scripting
fpath=(~/.zsh $fpath)

export NVM_DIR="/home/alice/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
