
function new() {
    session_name=$1
    tmux new-session -s $session_name -n 1 -d

    for i in {2..10}
    do
        tmux new-window -t $session_name -n $i
    done

    tmux attach-session -t $session_name
}


