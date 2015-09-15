# Setup fzf
# ---------
if [[ ! "$PATH" =~ "/home/alice/Code/dotfiles/extras/fzf/bin" ]]; then
  export PATH="$PATH:/home/alice/Code/dotfiles/extras/fzf/bin"
fi

# Man path
# --------
if [[ ! "$MANPATH" =~ "/home/alice/Code/dotfiles/extras/fzf/man" && -d "/home/alice/Code/dotfiles/extras/fzf/man" ]]; then
  export MANPATH="$MANPATH:/home/alice/Code/dotfiles/extras/fzf/man"
fi

# Auto-completion
# ---------------
[[ $- =~ i ]] && source "/home/alice/Code/dotfiles/extras/fzf/shell/completion.zsh" 2> /dev/null

# Key bindings
# ------------
source "/home/alice/Code/dotfiles/extras/fzf/shell/key-bindings.zsh"

