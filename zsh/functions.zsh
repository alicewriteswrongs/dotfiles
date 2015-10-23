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

function find_within_files() {
    ag --nobreak --noheading . | fzf
    zle redisplay
}

zle -N find_within_files
bindkey '^f' find_within_files

function vdo() {
    vagrant ssh -c '$1'
}

function gd() {
    if [[ $1 ]]; then
        git diff $1
    else
        git diff $(selectbranch)
    fi
}

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

function pullrequest() {
    branch=$(git rev-parse --abbrev-ref HEAD)
    if [[ $branch != 'master' ]]; then 
        rebase
        if [[ $1 == 'f' ]]; then
            echo "updating pull request for "$branch
            git push origin $branch -f
        else
            echo "creating pull request for "$branch
            git push origin $branch
        fi
    else
        echo "not on master doofus!"
    fi
}

function gbnuke() { # nuke the current branch or $1
    if [[ $1 && $1 != 'master' ]]; then
        git checkout master
        git branch -D $1
        git push origin :$1
    else
        branch=$(git rev-parse --abbrev-ref HEAD)
        if [[ $branch != 'master' ]]; then
            git checkout master
            git branch -D $branch
            git push origin :$branch
        fi
    fi
}

function rebase {
    git commit -a -m 'WIP'
    git fetch origin
    git rebase -i origin/master
}

function mergepr() { # merge a branch into master and push
    branch=$(git rev-parse --abbrev-ref HEAD)
    if [[ $branch != 'master' ]]; then
        echo "merging "$branch" into master"
        pullrequest f
        git checkout master
        git pull origin master
        git merge $branch
        git push origin master
        if [[ $1 == 'd' ]]; then
            gbnuke $branch
        fi
    fi
}

function rebdiff() { # rebase and reload diff
    git commit -a -m 'WIP'
    git rebase origin/master
    git diff origin/master
}

