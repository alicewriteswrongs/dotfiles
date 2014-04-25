1!/bin/bash

## dzen stuff
FG='white'
BG='#002b36'
FONT="-*-fixed-medium-*-*-*-12-*-*-*-*-*-*-*"
selbg='#859900'
selfb='#101010'

hc() { "${herbstclient_command[@]:-herbstclient}" "$@" ;}
monitor=${1:-0}
geometry=( $(herbstclient monitor_rect "$monitor") )
if [ -z "$geometry" ] ;then
    echo "Invalid monitor $monitor"
    exit 1
fi
x=${geometry[0]}
y=${geometry[1]}
panel_width=${geometry[2]}

function uniq_linebuffered() {
   awk '$0 != l { print ; l=$0 ; fflush(); }' "$@"
}

{
   conky -c ~/.conkyrc | while read -r; do
      echo -e "conky $REPLY";
      #break
   done > >(uniq_linebuffered) &
   childpid=$!
   herbstclient --idle
   kill $childpid
} | {
   TAGS=( $(herbstclient tag_status $monitor) ) 
      conky=""
      separator="^fg($selbg)^ro(1x16)^fg()"
      while true; do
         for i in "${TAGS[@]}" ; do
            echo -n "^ca(1,herbstclient use ${i:1}) "
            case ${i:0:1} in
            '#')
               echo -n "^fg($selbg)[^fg(#eee8d5)${i:1}^fg($selbg)]"
               ;;
            ':')
               echo -n "^fg(#eee8d5) ${i:1} "
               ;;
            *)
               echo -n "^fg(#657b83) ${i:1} "
               ;;
            esac
            echo -n "^ca()"
        done
        echo -n " $separator"
        conky_text_only=$(echo -n "$conky"|sed 's.\^[^(]*([^)]*)..g')
        width=$(textwidth "$FONT" "$conky_text_only  ")
        echo -n "^p(_RIGHT)^p(-$width)$conky"
        echo
        read line || break
        cmd=( $line )
   case "$cmd[0]" in
               tag*)
                  TAGS=( $(herbstclient tag_status $monitor) ) 
                  ;;
               conky*)
                  conky="${cmd[@]:1}"
                  ;;
               esac
     done
} 2> /dev/null |dzen2 -ta l -y $y -x $x -h 16 -w $panel_width -fg $FG -bg $BG -fn $FONT 
