# fzf functions
source ~/dotfiles/zsh/functions/github.zsh
source ~/dotfiles/zsh/functions/git.zsh

function find_within_files() {
    ag --nobreak --noheading . | fzf-tmux
    zle redisplay
}

zle -N find_within_files
bindkey '^f' find_within_files

function select_directory() {
    find ${1:-.} -type d 2> /dev/null | fzf-tmux 
}

function fancy_cd() {
    cd $(select_directory)
    zle redisplay
}

zle -N fancy_cd
bindkey '^P' fancy_cd

fkill() {
  pid=$(ps -ef | sed 1d | fzf-tmux -m | awk '{print $2}')

  if [ "x$pid" != "x" ]
  then
    kill -${1:-9} $pid
  fi
}

fcommit() {
  local commits commit
  commits=$(git log --pretty=oneline --abbrev-commit --reverse) &&
  commit=$(echo "$commits" | fzf-tmux --tac +s +m -e) &&
  git checkout $(echo "$commit" | sed "s/ .*//")
}

fhash() {
  local commits commit
  commits=$(git log --color=always --pretty=oneline --abbrev-commit --reverse) &&
  commit=$(echo "$commits" | fzf-tmux --tac +s +m -e --ansi --reverse) &&
  echo -n $(echo "$commit" | sed "s/ .*//")
}

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

function vreinstall() {
    sudo modprobe vboxdrv
    sudo /etc/init.d/virtualbox start
}

function npm_reset() {
    rm -r node_modules
    npm cache clean
    npm install
}

# improved WIP commits

function zip_it() {
    if [[ -f $1.zip ]]; then
        rm $1.zip
    fi
    zip -r $1.zip $1
}

