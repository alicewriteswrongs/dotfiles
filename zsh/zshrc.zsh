# The following lines were added by compinstall

zstyle ':completion:*' completer _complete _ignored
zstyle ':completion:*' completions 1
zstyle ':completion:*' menu select
zstyle ':completion:*' glob 1
zstyle ':completion:*' max-errors 5
zstyle ':completion:*' substitute 1
zstyle :compinstall filename '/home/benpote/.zshrc'

autoload -Uz compinit promptinit
compinit
promptinit
# End of lines added by compinstall
# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=2000
SAVEHIST=10000
setopt appendhistory autocd extendedglob nomatch notify
unsetopt beep
bindkey -e
# End of lines configured by zsh-newuser-install

setopt completealiases
autoload -U colors && colors
PROMPT="[%{$fg[green]%}%n%{$reset_color%}@%{$fg[blue]%}%m] %{$fg_no_bold[yellow]%}%3~ %{$reset_color%}%# "
RPROMPT="[%{$fg_no_bold[cyan]%}%@%{$reset_color%}]"


#git completion
fpath=(~/.zsh $fpath)

#####ALIASES

#edit some dotfiles
alias zshrc='vim ~/Code/dotfiles/.zshrc'
alias vimrc='vim ~/Code/dotfiles/.vimrc'
alias i3config='vim ~/Code/dotfiles/arch/i3config'

#Commands and programs
alias top='htop'			#use a better version of top instead
alias la='ls -alh'			#show hidden files and attribute
alias ls='ls --color=auto'  #colorize ls output
alias grep='grep -n --color=auto' #colorize grep output and line numbers
alias mkdir='mkdir -p -v'   #makes a directory and it's hierarchy, also verbose
alias mv='mv -iv'           #makes it interactive and verbose
alias usb='sudo mount /dev/sdb1 /mnt/usb' 
alias howbig='du -hc | tail -n 1'

#pacman
alias orphans='sudo pacman -Qdt'

#git commands
alias pretty='git log --pretty=oneline' #get succinct git log information
alias addall='git commit -a'		#add all changed files and commit
alias format='git log --pretty=format:"%h - %an, %ar : %s"'
alias pushom='git push origin master'
alias gits='git status'
alias gitc='git commit'
alias gitl='git log -1 HEAD' #last commit

#ssh aliases
alias scc='ssh benpote@scc2.bu.edu'
alias xscc='ssh -X benpote@scc2.bu.edu'
alias bioed='ssh benpote@bioed.bu.edu'
alias imac='ssh benpote@cumm005-0b01-dhcp-062.bu.edu'

#laptop aliases
alias qtconsole='ipython qtconsole --pylab=inline'
alias dotfiles='cd ~/Code/dotfiles/'    #get into dotfiles repo
alias documents='cd ~/Dropbox/Documents/'
alias notes='cd ~/notes'
alias todo='vim ~/notes/todo.markdown'
alias abcdehighqual='abcde -o ogg:"-q 7"' #rips at ogg vorbis quality level 7

#use vim instead of less
alias less='/usr/share/vim/vim74/macros/less.sh'

##key config

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
[[ -n "${key[PageUp]}"   ]]  && bindkey  "${key[PageUp]}"   beginning-of-buffer-or-history
[[ -n "${key[PageDown]}" ]]  && bindkey  "${key[PageDown]}" end-of-buffer-or-history

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
