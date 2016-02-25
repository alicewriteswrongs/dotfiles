# functions for working with git

function selectbranch() {
    git branch | fzf-tmux
}

function gs() { # use fzf-tmux to pick branches
    git commit -a -m "WIP"
    git checkout $(selectbranch)
    zle redisplay
}

zle -N gs
bindkey '^b' gs

function gd() {
    if [[ $1 ]]; then
        git diff $1
    else
        git diff .
    fi
}

function gds() {
    if [[ $1 ]]; then
        git diff $1
    else
        git diff $(selectbranch)
    fi
}

function gdfiles() {
    if [[ $1 ]]; then
        git diff --name-only $1
    else
        git diff --name-only $(selectbranch)
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

function prnew() {
    pullrequest
}

function pru() {
    pullrequest f
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
    if [[ $(current_branch) != 'master' ]]; then
        wipc
    fi
    if [[ origin_exists ]]; then
        git fetch origin
        git rebase -i origin/master
    else
        git rebase -i master
    fi
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
    wipc
    git rebase origin/master
    git diff origin/master
}


function blamesearch_include() {
    for f in $(git ls-files); do
        if [[ $(git blame $f | ag $1) ]]; then
            echo $f
        fi
    done
}

function blamesearch_exclude() {
    for f in $(git ls-files); do
        if [[ ! $(git blame $f | ag $1) ]]; then
            echo $f
        fi
    done
}


# fancy fixup WIP commits

function origin_exists () {
    [[ -d .git/refs/remotes/origin ]]
}

function first_commit_on_branch() {
    if [[ $(current_branch) != 'master' ]]; then
        if [[ origin_exists ]]; then
            git log $(current_branch) --not origin/master --format=%h | tail -n 1
        else
            git log $(current_branch) --not master --format=%h | tail -n 1
        fi
    else
        git log --format=%h | tail -n 1
    fi
}

function last_non_fixup_commit_on_branch () {
    if [[ $(current_branch) != 'master' ]]; then
        if [[ origin_exists ]]; then
            git log $(current_branch) --not origin/master --format=oneline | ag -v fixup! | head -n 1 | sed -e 's/\s.*$//'
        else
            git log $(current_branch) --not master --format=oneline | ag -v fixup! | head -n 1 | sed -e 's/\s.*$//'
        fi
    else
        git log --format=%H | head -n 1
    fi
}

function current_branch  () {
    git rev-parse --abbrev-ref HEAD
}

function wipc() {
    if [[ $(current_branch) != 'master' ]]; then
        if [[ $(last_non_fixup_commit_on_branch) != '' ]]; then
            git commit -a --fixup $(last_non_fixup_commit_on_branch)
        fi
    else
        echo "not on master..."
    fi
}
