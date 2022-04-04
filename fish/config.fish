if status is-interactive
    # Commands to run in interactive sessions can go here
end

set EDITOR nvim

fish_vi_key_bindings

source ~/dotfiles/fish/aliases.fish
set -gx VOLTA_HOME "$HOME/.volta"
set -gx PATH "$VOLTA_HOME/bin" $PATH
