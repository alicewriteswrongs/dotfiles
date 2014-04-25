[[ -f ~/.Xresources ]] && xrdb -merge ~/.Xresources
feh --bg-max ~/images/Edvard_Munch_-_Workers_on_their_Way_Home_-_Google_Art_Project.jpg
xinput set-prop "TPPS/2 IBM TrackPoint" "Evdev Wheel Emulation" 1
xinput set-prop "TPPS/2 IBM TrackPoint" "Evdev Wheel Emulation Button" 2
xinput set-prop "TPPS/2 IBM TrackPoint" "Evdev Wheel Emulation Timeout" 200
xinput set-prop "TPPS/2 IBM TrackPoint" "Evdev Wheel Emulation Axes" 6 7 4 5
touchpad-toggle.sh
/usr/bin/xscreensaver -no-splash &
xbindkeys
exec i3

