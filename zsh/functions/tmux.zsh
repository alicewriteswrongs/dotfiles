
function new() {
    session_name=$1
    tmux new-session -s $session_name -n code -d
    tmux new-window -t $session_name -n app
    tmux attach-session -t $session_name
}

function new_non_prog() {
    session_name=$1
    tmux new-session -s $session_name -n 1 -d
}
