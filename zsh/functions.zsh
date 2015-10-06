function selectbranch() {
    git branch | fzf
}

function gs() { # use fzf to pick branches
    git commit -a -m "WIP"
    git checkout $(selectbranch)
    zle redisplay
}

zle -N gs
bindkey '^b' gs

function gbnuke() { # nuke the current branch or $1
    if [[ $1 ]]; then
        git checkout master
        git branch -D $1
        git push origin :$1
    else
        branch=$(git rev-parse --abbrev-ref HEAD)
        git checkout master
        git branch -D $branch
        git push origin :$branch
    fi
}

function rebase() {
    git commit -a -m 'WIP'
    branch=$(git rev-parse --abbrev-ref HEAD)
    git checkout master
    git pull origin master
    git checkout $branch
    git rebase -i master
}
