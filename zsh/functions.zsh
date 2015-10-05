function selectbranch() {
    git branch | fzf
}

function gs() {
    git commit -a -m "WIP"
    git checkout $(selectbranch)
    zle redisplay
}

zle -N gs
bindkey '^b' gs

function wrebase() {
    git commit -a -m 'wip'
    branch=$(git rev-parse --abbrev-ref HEAD)
    git checkout master
    git pull origin master
    git checkout $branch
    git rebase -i master
}
