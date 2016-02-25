# a few things for working with github

function github_repo_location () {
    git remote -v | ag origin | head -n 1 | sed -e 's/^.*://' | sed -e 's/\..*//'
}

function ghub_branch() {
    xdg-open "https://github.com/`github_repo_location`/compare/`(current_branch)`"
}

function ghub_repo () {
    xdg-open "https://github.com/`github_repo_location`"
}


function get_pull_request_numbeR() {
    local current_commit=$(git rev-parse HEAD)
    local current_branch=$(git rev-parse --abbrev-ref HEAD)

    # find all origin/pull branches with commit
    # use sed to get just the PR number
}


