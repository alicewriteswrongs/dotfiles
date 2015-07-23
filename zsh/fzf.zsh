# Setup fzf
# ---------
if [[ ! "$PATH" =~ "/home/alice/Code/utility/fzf/bin" ]]; then
  export PATH="$PATH:/home/alice/Code/utility/fzf/bin"
fi

# Man path
# --------
if [[ ! "$MANPATH" =~ "/home/alice/Code/utility/fzf/man" && -d "/home/alice/Code/utility/fzf/man" ]]; then
  export MANPATH="$MANPATH:/home/alice/Code/utility/fzf/man"
fi

# Auto-completion
# ---------------
[[ $- =~ i ]] && source "/home/alice/Code/utility/fzf/shell/completion.zsh" 2> /dev/null

# Key bindings
# ------------
source "/home/alice/Code/utility/fzf/shell/key-bindings.zsh"

