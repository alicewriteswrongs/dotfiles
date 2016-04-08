#Xresources file
[[ -f ~/.Xresources ]] && xrdb -merge ~/.Xresources

# deal with keychain (ssh key thing)
keychain ~/.ssh/id_ecdsa
[ -f ~/.keychain/$HOSTNAME-sh ] && . ~/.keychain/$HOSTNAME-sh 2>/dev/null
[ -f ~/.keychain/$HOSTNAME-sh-gpg ] && . ~/.keychain/$HOSTNAME-sh-gpg 2>/dev/null
export SSH_ASKPASS=ssh-askpass

# #background image
feh --bg-max /home/alice/Pictures/parkspins.jpg &

pulseaudio &

#start mpd
# [ ! -s ~/.config/mpd/pid ] && mpd

#start mpdas
# [[ -z $(pgrep -xU $UID mpdas) ]] && mpdas &

#trackpoint config for thinkpad
xinput set-prop "TPPS/2 IBM TrackPoint" "Evdev Wheel Emulation" 1
xinput set-prop "TPPS/2 IBM TrackPoint" "Evdev Wheel Emulation Button" 2
xinput set-prop "TPPS/2 IBM TrackPoint" "Evdev Wheel Emulation Timeout" 200
xinput set-prop "TPPS/2 IBM TrackPoint" "Evdev Wheel Emulation Axes" 6 7 4 5
xinput set-prop "TPPS/2 IBM TrackPoint" "Device Accel Constant Deceleration" 0.75

#touchpad config (tap and stuff)
synclient TapButton1=1
synclient HorizTwoFingerScroll=1

#japanese input stuff
# export GTK_IM_MODULE=fcitx
# export QT_IM_MODULE=fcitx
# export XMODIFIERS="@im=fcitx"
# fcitx 

# export XCURSOR_PATH=""

nm-applet &

# xset dpms 300 600 0 &

#make keybinds (for thinkpad media keys, etc)
xbindkeys &

xscreensaver &

#start redshift (color temperature thing)
redshift -l 42:-71 &

SpiderOakONE &

# #start gnome keyright (for networkmanager to work correctly)
# source /etc/X11/xinit/xinitrc.d/30-dbus
# eval $(/usr/bin/gnome-keyring-daemon --start --components=gpg,pkcs11,secrets,ssh)
# export GNOME_KEYRING_CONTROL GNOME_KEYRING_PID GPG_AGENT_INFO SSH_AUTH_SOCK

#screen locker (not for power changes, systemd service handles that)
# xautolock -time 10 -locker "/home/alice/Code/shellscripts/i3lock.sh" &

#start owncloud
# owncloud &

#start that nice clipboard manager
# parcellite &

#start the drop shadows
compton -c &

#keep touchscreen aligned
# xrandr-align monitor --input="ELAN Touchscreen" &

#start i3wm
exec i3
