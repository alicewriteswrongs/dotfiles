# Setup fzf
# ---------
if [[ ! "$PATH" =~ "/home/alice/Code/dotfiles/fzf/bin" ]]; then
  export PATH="$PATH:/home/alice/Code/dotfiles/fzf/bin"
fi

# Man path
# --------
if [[ ! "$MANPATH" =~ "/home/alice/Code/dotfiles/fzf/man" && -d "/home/alice/Code/dotfiles/fzf/man" ]]; then
  export MANPATH="$MANPATH:/home/alice/Code/dotfiles/fzf/man"
fi

# Auto-completion
# ---------------
[[ $- =~ i ]] && source "/home/alice/Code/dotfiles/fzf/shell/completion.zsh" 2> /dev/null

# Key bindings
# ------------
source "/home/alice/Code/dotfiles/fzf/shell/key-bindings.zsh"

