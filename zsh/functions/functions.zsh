# fzf functions
source ~/dotfiles/zsh/functions/github.zsh
source ~/dotfiles/zsh/functions/git.zsh
source ~/dotfiles/zsh/functions/fzf.zsh

function vdo { ssh default "/bin/bash -l -c '$*'" }

function crun() {
    if [[ ! $1 ]]; then
        echo "no target supplied, just building"
        make
    elif [[ -f $1 && $1 = *.c ]]; then
        target=$(echo $1 | sed 's/\(.*\)\..*/\1/')
        if [[ -f $target ]]; then
            rm $target
        fi
        make $target
        ./$target
    else
        if [[ -f $1 ]]; then
            rm $1
        fi
        make $1
        ./$1
    fi
}
function new() {
    session_name=$1
    tmux new-session -s $session_name -n 1 -d

    for i in {2..10}
    do
        tmux new-window -t $session_name -n $i
    done

    tmux attach-session -t $session_name
}

function install() {
    sudo apt install $1
}

function uninstall() {
    sudo apt remove $1
}

function latex_to_markdown() {
    pandoc $1 -f latex -t markdown -o $2
}

function sscreen() {
    scrot -s ~/screens/$1
}

function zip_it() {
    if [[ -f $1.zip ]]; then
        rm $1.zip
    fi
    zip -r $1.zip $1
}

