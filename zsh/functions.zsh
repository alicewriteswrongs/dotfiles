function selectbranch() {
    git branch | fzf
}

function gs {
    git commit -a -m "WIP"
    git checkout $(selectbranch)
}
