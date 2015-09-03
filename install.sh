#!/bin/sh

echo "you can try to run this, or use it as a setup guide"
echo "the dotfiles repo should already be cloned in ~/Code/dotfiles"
echo "install packages"
sudo apt-get install vim-gnome python-dev python3-dev tmux zsh build-essential cmake node-legacy npm silversearcher-ag htop chromium mpd git ruby rvm python-pip python3-pip
sudo npm install -g keybase

echo "pull in git submodules"
cd ~/Code/dotfiles && git submodule init && git submodule update

echo "change shell to zsh"
chsh $(whoami) &&

echo "symlink dotfiles"
rm ~/.vimrc
ln -s ~/Code/dotfiles/vimrc/vimrc ~/.vimrc
rm ~/.zshrc && rm ~/.zshenv
ln -s ~/Code/dotfiles/zsh/zshrc.zsh ~/.zshrc
ln -s ~/Code/dotfiles/zsh/zshenv.zsh ~/.zshenv
ln -s ~/Code/dotfiles/tmux/tmux.conf ~/.tmux.conf
rm ~/.gitconfig && ln -s ~/Code/dotfiles/git/.gitconfig ~/.gitconfig

echo "get vim plugins"
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
echo "USER INTERVENTION: run 'PluginInstall'" && 
vim && python ~/.vim/bundle/youcompleteme/install.py

# install solarized colors for gnome-terminal
cd ~/Code/dotfiles/gnome-terminal-colors-solarized/ && ./install.sh

echo "generate an ssh keypair with"
echo ""
echo " ssh-keygen -t rsa -b 4096 -C 'email@domain.org'"
echo ""
echo "remember to add it to github!"

echo ""
echo "also, log in to keybase!"


echo "you're done!"
