# Dotfiles

For the syncing of the dotfiles. For the sake of consistency try to always clone in:

`~/Code/dotfiles`

the setup is dependent on this, for sourcing modular vimrc and zshrc files.



------------------

### Included herein:

syntax: file (location to symlink) -notes

* vimrc
    * imac_vimrc (~/.vimrc)
    * laptop_vimrc (~/.vimrc)
* zsh
    * imac_zshenv
    * imac_zshrc
    * laptop_zshenv
    * laptop_zshrc
* .slate (~/.slate) -os x only
* .muttrc (~/.muttrc)
* .bashrc (~/.bashrc)
    * .bashrc-mac (~/.bashrc) -os x only
* .bash\_profile (~/.bash\_profile)
* git-completion.bash (.git-completion.bash)
* solarized.vim (~/.vim/colors/solarized.vim)
* mopidy.conf (~/.config/mopidy/mopidy.conf)
* arch directory:   -config files for things specific to archlinux
    * autostart (~/.config/herbstluftwm/autostart)
    * panel.sh (~/.config/herbstluftwm/panel.sh)
    * solarized (no symlink)
    * .Xresources ~/.Xresources)
    * urxvt (no symlink)
    * ncmpcppconfig (~/.ncmpcpp/config) (note different names!)
    * .conkyrc (~/.conkyrc) -conky configured for info-bar
    * hlwm-other-panel -contains an attempted hlwm config
    * newpanel.sh -dzen2 script for use w/ conky and hlwm
    * i3config (~/.i3/config)
    * .i3status.conf (~/.i3status.conf)
* sup directory:   -config files for sup email client
    * .offlineimaprc -copy to ~/.offlineimaprc, needs acct info (no symlink)
    * .msmtprc -copy to ~/.msmtprc, needs acct info (no symlink)
    * .xsessionrc (~/.xsessionrc) just has settings for scrolling with trackpoint


### How to use

* Leave all the files in this directory
* Edit files only in the dropbox/dotfiles directory!
* Do the following:

    $ ln -s ~/Code/dotfiles/.dotfile /path/to/.dotfile

and it should be loaded correctly!

### Remember to:

* Install things like solarized colorscheme for vim

-------------

