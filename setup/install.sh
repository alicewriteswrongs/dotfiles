#!/bin/bash

mkdir ~/Code

sudo pacman -Syyu

# start by installing some utilities

# common userspace utilities
sudo pacman -S vim tmux zsh the_silver_searcher htop mpd git exuberant-ctags virtualbox vagrant mupdf transmission-gtk scrot redshift keychain 

# stuff for mail
sudo pacman -S notmuch

# latex
sudo pacman -S texlive-core texlive-latexextra texlive-science

# install vagrant for VMs
sudo pacman -S nfs-utils
sudo modprobe nfsd
sudo service rpcbind start
sudo service nfs-kernel-server start
sudo systemctl stop nfs-kernel-server.service
sudo systemctl disable nfs-kernel-server.service
sudo systemctl enable nfs-kernel-server.service
sudo systemctl start nfs-kernel-server.service

# install various langauge runtimes and build tools
sudo pacman -S go
sudo pacman -S  python-pip python2-pip python-virtualenv python2-virtualenv ppython-setuptools python2-setuptools
sudo pacman -S autoconf automake libtool cmake pkg-config clang clang-tools-extra
# sudo pacman -S libboost1.55-dev-all libboost1.55-dev libboost1.55-tools-dev scons libgdbm libgdbm-dev libncurses5 libncurses5-dev bison libreadline6 libreadline6-dev libyaml libyaml-dev libsqlite3 libsqlite3-dev sqlite3 libffi libffi-dev libpq libpq-dev notmuch libnotmuch3 libnotmuch-dev libglibmm-2.4-dev libgtkmm-3.0-1 libgtkmm-3.0-dev libgmime-2.6-0 libgmime-2.6-dev libwebkitgtk-3.0-0 libwebkitgtk-3.0-dev libwebkit-dev g++
sudo pacman -S nodejs npm

# ruby need some special treatment (sigh)
gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3
gpg --keyserver hkp://pool.sks-keyservers.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3
\curl -sSL https://get.rvm.io | bash -s stable
source ~/.rvm/scripts/rvm
rvm install ruby-2.2.3
rvm use 2.2.3
gem install bundler
rvm rvmrc warning ignore allGemfiles

# stuff that depends on nodejs / npm
sudo npm install -g elm
sudo npm install -g elm-oracle
sudo npm install -g tern

# install some security related stuff
sudo pacman -S tor 
sudo pacman -S openssl curl libxml2 pinentry xclip
sudo pacman -S keybase
git clone git@github.com:lastpass/lastpass-cli.git ~/Code/
cd ~/Code/lastpass-cli && make && sudo make install
echo "now login to lastpass and keybase!"

# install and setup i3
sudo pacman -S feh parcellite compton xautolock xscreensaver dmenu
sudo pacman -S libxcb pango yajl startup-notification libev libxkbcommon libxkbcommon-x11 xcb-util-keysyms xcb-util xcb-util-wm xcb-util-cursor

git clone git@github.com:Airblader/i3.git ~/Code/i3-gaps
cd ~/Code/i3-gaps
git checkout gaps && git pull
make
sudo make install
mkdir ~/.i3
ln -s ~/dotfiles/i3/i3config ~/.i3/config
sudo pip install i3pystatus colour psutil

# set chromium as link opening default app
xdg-mime default chromium.desktop x-scheme-handler/http
xdg-mime default chromium.desktop x-scheme-handler/https
xdg-mime default chromium.desktop text/html

# make an ssh key
function generate_ssh_key() {
    if [[ $1 ]]; then
        ssh-keygen -t ecdsa -b 521 -C $1
        eval "$(ssh-agent -s)"
        ssh-add ~/.ssh/id_ecdsa
    else
        echo "provide an email to use"
    fi
}
# generate_ssh_key alice.writes.wrongs@gmail.com

# symlink dotfiles, install vim stuff and some shell extensions
echo "pull in git submodules"
cd ~/dotfiles && git submodule init && git submodule update

echo "change shell to zsh"
chsh -s "$(which zsh)"

echo "install solarized colors for gnome-terminal"
cd ~/dotfiles/extras/gnome-terminal-colors-solarized/ && ./install.sh

echo "install fzf"
cd ~/dotfiles/extras/fzf && ./install

echo "install fonts"
cd ~/dotfiles/extras/fonts && ./install.sh

echo "symlink dotfiles"
rm ~/.vimrc
rm ~/.zshrc
rm ~/.zshenv
rm ~/.gitconfig
mkdir ~/.config/xfce4/terminal
rm ~/.config/xfce4/terminal/terminalrc
ln -s ~/dotfiles/vimrc/vimrc ~/.vimrc
ln -s ~/dotfiles/zsh/zshrc.zsh ~/.zshrc
ln -s ~/dotfiles/zsh/zshenv.zsh ~/.zshenv
ln -s ~/dotfiles/tmux/tmux.conf ~/.tmux.conf
ln -s ~/dotfiles/git/.gitconfig ~/.gitconfig
ln -s ~/dotfiles/X/.xscreensaver ~/.xscreensaver
ln -s ~/dotfiles/X/.xinitrc ~/.xinitrc
ln -s ~/dotfiles/tern/.tern-config ~/.tern-config
ln -s ~/dotfiles/xfce4-term/terminalrc ~/.config/xfce4/terminal/terminalrc


echo "get vim plugins"
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
echo "install vim pluings"
vim +PluginInstall +qall && python ~/.vim/bundle/youcompleteme/install.py --gocode-completer --tern-completer --clang-completer
mkdir ~/.vim/backup
mkdir ~/.vim/undo

source ~/.zshrc
