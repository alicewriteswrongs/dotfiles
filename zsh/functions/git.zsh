# functions for working with git

function selectbranch() {
    git branch | fzf-tmux
}

function gs() { # use fzf-tmux to pick branches
    git commit -a -m "WIP" -S
    git checkout $(selectbranch | tr -d ' ')
    zle redisplay
}

zle -N gs
bindkey '^b' gs

function gbd() { # delete a branch
    if [[ $1 ]]; then
        git branch -D $1
    else
        local branch=$(selectbranch | sed -e 's/^\s*//')
        local response
        read "response?delete $branch? [yn] "
        if [[ $response =~ ^[Yy]$ ]]; then
            git branch -D $branch
        else
            echo "not deleting $branch"
        fi
    fi
}

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

# managing opening and updating pullrequests
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
    git fetch origin
}

function prnew() {
    pullrequest
    if [[ origin_exists ]]; then
        ghbranch
    fi
}

function pru() {
    pullrequest f
}

# delete local and remote branch
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
        if [[ $1 == 'i' ]]; then
            git rebase -i -S origin/master
        else
            GIT_SEQUENCE_EDITOR=: git rebase -i -S origin/master
        fi
    else
        if [[ $1 == 'i' ]]; then
            git rebase -i -S master
        else
            GIT_SEQUENCE_EDITOR=: git rebase -i -S master
        fi

    fi
}

function mergepr() { # merge a branch into master and push
    branch=$(git rev-parse --abbrev-ref HEAD)
    if [[ $branch != 'master' ]]; then
        echo "merging "$branch" into master"
        pullrequest f
        rebase i
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
    git rebase -S origin/master
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
            git commit -a -S --fixup $(last_non_fixup_commit_on_branch)
        fi
    else
        echo "not on master..."
    fi
}

function penultimate_commit () {
    git log --format=%H -2 | tail -n 1
}

function gdlast () {
    git diff $(penultimate_commit)
}
