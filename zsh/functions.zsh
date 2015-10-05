function selectbranch() {
    git branch | fzf
}

function gs {
    git checkout $(selectbranch)
}
