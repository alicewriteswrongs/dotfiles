#!/bin/sh

function help () {
    echo "you can run this, or use it as a setup guide"
    echo "the dotfiles repo should already be cloned in ~/dotfiles"
    echo "install packages"
    echo "this will take a while"
}

function update() {
    sudo apt-get update
    sudo apt-get -y upgrade
}

## installation functions
## each installs a group of packages, then does any needed manual setup

function install 
sudo apt-get -y install vim-gnome tmux zsh nodejs-legacy npm silversearcher-ag htop mpd git exuberant-ctags virtualbox vagrant mupdf transmission-daemon redshift-gtk scrot

#go stuff
function install_go() {
    sudo apt-get -y install golang-go
}

#ruby things
function install_ruby() {
    sudo apt-get -y install ruby rbenv
}

#python things
function install_python() {
    sudo apt-get -y install python3-dev python-pip python3-pip python-virtualenv python-setuptools python3-setuptools
}

#libraries and build dependencies for C stuff
sudo apt-get -y install build-essential autoconf libboost1.55-dev-all libboost1.55-dev libboost1.55-tools-dev scons libgdbm libgdbm-dev libncurses5 libncurses5-dev automake libtool bison pkg-config cmake libreadline6 libreadline6-dev libyaml libyaml-dev libsqlite3 libsqlite3-dev sqlite3 libffi libffi-dev libpq libpq-dev notmuch libnotmuch3 libnotmuch-dev libglibmm-2.4-dev libgtkmm-3.0-1 libgtkmm-3.0-dev libgmime-2.6-0 libgmime-2.6-dev libwebkitgtk-3.0-0 libwebkitgtk-3.0-dev libwebkit-dev g++

#gpg stuff
sudo npm install -g keybase

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

echo "get rvm!"
gpg --keyserver hkp://pgp.mit.edu --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3
\curl -sSL https://get.rvm.io | bash

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

echo "get vim plugins"
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
echo "install vim pluings"
vim +PluginInstall +qall && python ~/.vim/bundle/youcompleteme/install.py

source ~/.zshrc

echo "now, log in to keybase!"
echo ""
echo "gnome-terminal also needs some manual config :("
echo ""
echo "you're done!"
