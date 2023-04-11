source ~/dotfiles/zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=3'
bindkey '^ ' autosuggest-execute

ZSH_AUTOSUGGEST_CLEAR_WIDGETS+=("expand-or-complete")
ZSH_DISABLE_COMPFIX="true"

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

HISTFILE=~/.histfile
HISTSIZE=1000000000
SAVEHIST=$HISTSIZE
setopt appendhistory autocd extendedglob nomatch notify extended_history inc_append_history hist_ignore_all_dups
unsetopt beep
bindkey -v

setopt completealiases
autoload -U colors && colors

setopt prompt_subst
. ~/dotfiles/zsh/script/git-prompt.sh

## MY PROMPT
## looks like dir         current_time
PROMPT=" %{$fg[blue]%}%n%{$reset_color%} %{$fg[magenta]%}%1~ %{$reset_color%}% "
# PROMPT=" %{$fg[blue]%}%n%{$reset_color%}|%{$fg[magenta]%}<3 %{$fg_no_bold[yellow]%}%1~ %{$reset_color%}" # less old version!
#PROMPT="[%{$fg[green]%}%n%{$reset_color%}@%{$fg[blue]%}%m] %{$fg_no_bold[yellow]%}%1~ %{$reset_color%}%# " #old version!
RPROMPT=$'%{$fg_no_bold[yellow]%}$(__git_ps1 "%s")%{$fg[magenta]%}$(__git_ps1 " ")%{$fg_no_bold[blue]%}%T%{$reset_color%}'
#♥

if whence dircolors >/dev/null; then
  eval `dircolors ~/dotfiles/zsh/dir_colors`
fi

export CLICOLOR=1
export LSCOLORS=exfxgedxbxegedabagacad

chpwd() {
    ls -lrthG
}

source ~/dotfiles/zsh/aliases.zsh
source ~/dotfiles/zsh/functions/functions.zsh

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

typeset -U path
path=(~/Code/shellscripts ~/Library/Python/3.9/bin $path)

stty stop undef

export KEYTIMEOUT=1

#export Vim as my default editor
export EDITOR="nvim"

#let nvim have better color support
export NVIM_TUI_ENABLE_TRUE_COLOR=1

fpath=(~/.zsh $fpath)
# export PATH="$PATH:/home/alice/dotfiles/tmux/battery/bin"

export NVM_DIR="/home/alice/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

export CDPATH="/Users/alice/Code:/Users/alice:."

source ~/dotfiles/zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

source /opt/homebrew/opt/fzf/shell/key-bindings.zsh
source /opt/homebrew/opt/fzf/shell/completion.zsh

export VOLTA_HOME="$HOME/.volta"
export PATH="$VOLTA_HOME/bin:$PATH"
