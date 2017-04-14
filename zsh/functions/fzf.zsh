function find_within_files() {
    ag --nobreak --noheading . | fzf-tmux
    zle redisplay
}

zle -N find_within_files
bindkey '^f' find_within_files

function select_directory() {
    find ${1:-.} -type d 2> /dev/null | fzf-tmux 
}

# function fancy_cd() {
#     cd $(select_directory)
#     zle redisplay
# }

# zle -N fancy_cd
# bindkey '^P' fancy_cd

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
