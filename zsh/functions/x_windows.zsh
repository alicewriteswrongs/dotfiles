function title {
   echo -ne "\033]0;$1\007"
}

function floating_gnome_term {
    gnome-terminal -e "zsh -c '$(declare -f title); title Float; zsh'"
}
