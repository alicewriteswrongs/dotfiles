function fish_right_prompt -d "Write out the right prompt"
    set -l normal (set_color normal)
    set -l yellow (set_color yellow)
    set -l blue (set_color blue)
    set -l red (set_color red)
    echo -n -s $yellow (fish_vcs_prompt) " " $red "::" $blue (date '+%l:%M')
end
