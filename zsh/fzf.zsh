# Setup fzf
# ---------
if [[ ! "$PATH" =~ "/home/alice/dotfiles/extras/fzf/bin" ]]; then
  export PATH="$PATH:/home/alice/dotfiles/extras/fzf/bin"
fi

# Man path
# --------
if [[ ! "$MANPATH" =~ "/home/alice/dotfiles/extras/fzf/man" && -d "/home/alice/dotfiles/extras/fzf/man" ]]; then
  export MANPATH="$MANPATH:/home/alice/dotfiles/extras/fzf/man"
fi

# Auto-completion
# ---------------
[[ $- =~ i ]] && source "/home/alice/dotfiles/extras/fzf/shell/completion.zsh" 2> /dev/null

# Key bindings
# ------------
source "/home/alice/dotfiles/extras/fzf/shell/key-bindings.zsh"

