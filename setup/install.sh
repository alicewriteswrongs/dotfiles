#!/bin/bash

# first symlink sources.list
sudo mv /etc/apt/sources.list ~/sources.list.old
sudo ln -s ~/dotfiles/setup/sources.list /etc/apt/sources.list
mkdir ~/Code

# then pull in new package lists
function update() {
    sudo apt update
    sudo apt -y dist-upgrade
}
update

# start by installing some utilities

# common userspace utilities
sudo apt -y install vim-gnome tmux zsh silversearcher-ag htop mpd git exuberant-ctags virtualbox vagrant mupdf transmission-daemon redshift-gtk scrot redshift ssh-askpass keychain gpg_agent ssh-askpass-gnome

# stuff for mail
sudo apt install -y notmuch libnotmuch4 libnotmuch-dev

# latex
sudo apt install texlive-full texlive-extra-utils texlive-math-extra texlive-latex-base texlive-latex-extra cweb-latex

# install vagrant for VMs
sudo apt install virtualbox vagrant nfs-common nfs-kernel-server portmap 
sudo service rpcbind start
sudo service nfs-kernel-server start

# install various langauge runtimes and build tools
sudo apt -y install golang-go
sudo apt -y install python3-dev python-dev python-pip python3-pip python-virtualenv python-setuptools python3-setuptools
sudo apt -y install build-essential autoconf automake libtool cmake pkg-config
sudo apt -y install libboost1.55-dev-all libboost1.55-dev libboost1.55-tools-dev scons libgdbm libgdbm-dev libncurses5 libncurses5-dev bison libreadline6 libreadline6-dev libyaml libyaml-dev libsqlite3 libsqlite3-dev sqlite3 libffi libffi-dev libpq libpq-dev notmuch libnotmuch3 libnotmuch-dev libglibmm-2.4-dev libgtkmm-3.0-1 libgtkmm-3.0-dev libgmime-2.6-0 libgmime-2.6-dev libwebkitgtk-3.0-0 libwebkitgtk-3.0-dev libwebkit-dev g++

# node and ruby need some special treatment (sigh)
gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3
gpg --keyserver hkp://pool.sks-keyservers.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3
\curl -sSL https://get.rvm.io | bash -s stable
source ~/.rvm/scripts/rvm
rvm install ruby-2.2.3
rvm use 2.2.3
gem install bundler
rvm rvmrc warning ignore allGemfiles

curl -sL https://deb.nodesource.com/setup_0.12 | sudo bash -
sudo apt install -y nodejs

# stuff that depends on nodejs / npm
npm install -g elm
npm install -g elm-oracle
npm install -g tern

# install some security related stuff
sudo apt install tor torbrowser-launcher
sudo apt install openssl libcurl3 libxml2 libssl-dev libxml2-dev libcurl4-openssl-dev pinentry-curses xclip
sudo apt install keybase
git clone git@github.com:lastpass/lastpass-cli.git ~/Code/
cd ~/Code/lastpass-cli && make && sudo make install
echo "now login to lastpass and keybase!"

# install and setup i3
sudo apt install suckless-tools i3-wm i3 i3-wm-debug feh nm-applet parcellite compton xautolock xscreensaver
sudo apt install libxcb1-dev libxcb-keysyms1-dev libpango1.0-dev libxcb-util0-dev libxcb-icccm4-dev libyajl-dev libstartup-notification0-dev libxcb-randr0-dev libev-dev libxcb-cursor-dev libxcb-xinerama0-dev libxcb-xkb-dev libxkbcommon-dev libxkbcommon-x11-dev
git clone git@github.com:Airblader/i3.git ~/Code/i3-gaps
cd ~/Code/i3-gaps
git checkout gaps && git pull
make
sudo make install
mkdir ~/.i3
ln -s ~/dotfiles/i3/i3config ~/.i3/config
sudo pip install i3pystatus colour psutil

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
generate_ssh_key alice.writes.wrongs@gmail.com

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
ln -s ~/dotfiles/vimrc/vimrc ~/.vimrc
ln -s ~/dotfiles/zsh/zshrc.zsh ~/.zshrc
ln -s ~/dotfiles/zsh/zshenv.zsh ~/.zshenv
ln -s ~/dotfiles/tmux/tmux.conf ~/.tmux.conf
ln -s ~/dotfiles/git/.gitconfig ~/.gitconfig
ln -s ~/dotfiles/X/.xscreensaver ~/.xscreensaver
ln -s ~/dotfiles/X/.xinitrc ~/.xinitrc
ln -s ~/dotfiles/tern/.tern-config ~/.tern-config


echo "get vim plugins"
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
echo "install vim pluings"
vim +PluginInstall +qall && python ~/.vim/bundle/youcompleteme/install.py --gocode-completer --tern-completer
mkdir ~/.vim/backup
mkdir ~/.vim/undo

source ~/.zshrc
