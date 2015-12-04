# fzf functions

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

# function clr() {
#     clear
#     zle redisplay
# }
# zle -N clr
# bindkey '^n' clr

function find_within_files() {
    ag --nobreak --noheading . | fzf-tmux
    zle redisplay
}

zle -N find_within_files
bindkey '^f' find_within_files

function fda() {
    local dir
    dir=$(find ${1:-.} -type d 2> /dev/null | fzf-tmux +m) && cd "$dir"
}

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

function gdfiles() {
    if [[ $1 ]]; then
        git diff --name-only $1
    else
        git diff --name-only $(selectbranch)
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

function new() {
    session_name=$1
    tmux new-session -s $session_name -n 1 -d

    for i in {2..10}
    do
        tmux new-window -t $session_name -n $i
    done

    tmux attach-session -t $session_name
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

function get_pull_request_numbeR() {
    local current_commit=$(git rev-parse HEAD)
    local current_branch=$(git rev-parse --abbrev-ref HEAD)

    # find all origin/pull branches with commit
    # use sed to get just the PR number
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

function screenshot_selection() {
    scrot -s ~/screens/$1
}
