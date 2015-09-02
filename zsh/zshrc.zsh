source ~/Code/dotfiles/zsh/zshenv.zsh
source ~/Code/dotfiles/zsh/functions.zsh
source ~/Code/dotfiles/zsh/general_config.zsh
source ~/Code/dotfiles/zsh/aliases.zsh
source ~/Code/dotfiles/zsh/keybind_config.zsh
[ -f ~/Code/dotfiles/zsh/fzf.zsh ] && source ~/Code/dotfiles/zsh/fzf.zsh

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting

fpath=(~/.zsh $fpath)
