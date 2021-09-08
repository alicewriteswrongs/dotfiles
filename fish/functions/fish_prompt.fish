function fish_prompt --description 'Write out the prompt'
    set -l normal (set_color normal)
    set -l yellow (set_color yellow)
    set -l blue (set_color blue)
    set -l red (set_color red)

    echo -n -s $blue $USER " " $red "::" " " $yellow (prompt_pwd) $normal " "
end
