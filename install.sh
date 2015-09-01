#!/bin/sh

#you can try to run this, or use it as a setup guide

sudo apt-get install vim-gnome python-dev python3-dev tmux zsh build-essential cmake
rm ~/.vimrc
ln -s ~/Code/dotfiles/vimrc/vimrc ~/.vimrc
rm ~/.zshrc && rm ~/.zshenv
ln -s ~/Code/dotfiles/zsh/zshrc.zsh ~/.zshrc
ln -s ~/Code/dotfiles/zsh/zshenv.zsh ~/.zshenv
chsh $(whoami)
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
echo "run 'PluginInstall'"
vim && python ~/.vim/bundle/youcompleteme/install.py
ln -s ~/Code/dotfiles/tmux/tmux.conf ~/.tmux.conf
cd ~/Code/dotfiles && git submodule init && git submodule update
