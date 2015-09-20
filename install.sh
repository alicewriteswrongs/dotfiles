#!/bin/sh

echo "you can run this, or use it as a setup guide"
echo "the dotfiles repo should already be cloned in ~/Code/dotfiles"
echo "install packages"
echo "this will take a while"
sudo apt-get update
sudo apt-get -y upgrade

echo "we're going to make an ssh key, and install chromium."
echo "add it to github before continuing!"
ssh-keygen -t rsa -b 4096 -C 'alice.writes.wrongs@gmail.com'

#chromium 
sudo apt-get -y install vim-gnome python-dev python3-dev tmux zsh build-essential cmake nodejs-legacy npm silversearcher-ag htop mpd git ruby rbenv python-pip python3-pip exuberant-ctags golang-go libreadline6-dev libyaml-dev libsqlite3-dev sqlite3 autoconf libgdbm-dev libncurses5-dev automake libtool bison pkg-config libffi-dev libpq-dev virtualbox vagrant mupdf
sudo npm install -g keybase

echo "pull in git submodules"
cd ~/Code/dotfiles && git submodule init && git submodule update

echo "change shell to zsh"
chsh -s "$(which zsh)"

echo "install solarized colors for gnome-terminal"
cd ~/Code/dotfiles/extras/gnome-terminal-colors-solarized/ && ./install.sh

echo "install fzf"
cd ~/Code/dotfiles/extras/fzf && ./install

echo "install fonts"
cd ~/Code/dotfiles/extras/fonts && ./install.sh

echo "get rvm!"
gpg --keyserver hkp://pgp.mit.edu --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3
\curl -sSL https://get.rvm.io | bash

echo "symlink dotfiles"
rm ~/.vimrc
rm ~/.zshrc
rm ~/.zshenv
rm ~/.gitconfig
ln -s ~/Code/dotfiles/vimrc/vimrc ~/.vimrc
ln -s ~/Code/dotfiles/zsh/zshrc.zsh ~/.zshrc
ln -s ~/Code/dotfiles/zsh/zshenv.zsh ~/.zshenv
ln -s ~/Code/dotfiles/tmux/tmux.conf ~/.tmux.conf
ln -s ~/Code/dotfiles/git/.gitconfig ~/.gitconfig

echo "get vim plugins"
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
echo "USER INTERVENTION: run 'PluginInstall'" && 
vim && python ~/.vim/bundle/youcompleteme/install.py

source ~/.zshrc

echo ""
echo "generate an ssh keypair with"
echo ""
echo " ssh-keygen -t rsa -b 4096 -C 'email@domain.org'"
echo ""
echo "remember to add it to github!"
echo ""
echo "also, log in to keybase!"
echo ""
echo "gnome-terminal also needs some manual config :("
echo ""
echo "you're done!"
