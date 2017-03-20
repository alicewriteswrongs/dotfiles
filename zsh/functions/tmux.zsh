
function new() {
    tmux new -s $1
}

function new_non_prog() {
    session_name=$1
    tmux new-session -s $session_name -d
    tmux attach-session -t $session_name
}
