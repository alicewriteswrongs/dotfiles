function title {
   echo -ne "\033]0;$1\007"
}

function floating_xfce4_term {
    xfce4-terminal -e "zsh -c '$(declare -f title); title Float; zsh'"
}
