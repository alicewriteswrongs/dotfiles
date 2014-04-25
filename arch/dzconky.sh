#!/bin/sh

FG='#aaaaaa'
BG='#1a1a1a'
FONT='-*-terminus-*-r-normal-*-*-120-*-*-*-*-iso8859-*'
conky | dzen2 -e - -h '16' -w '600' -ta r -fg $FG -bg $BG -fn $FONT &
