#!/bin/sh

echo "you can run this, or use it as a setup guide"
echo "the dotfiles repo should already be cloned in ~/Code/dotfiles"
echo "install packages"
sudo apt-get -y install vim-gnome python-dev python3-dev tmux zsh build-essential cmake nodejs-legacy npm silversearcher-ag htop chromium mpd git ruby rbenv python-pip python3-pip exuberant-ctags
sudo npm install -g keybase

echo "pull in git submodules"
cd ~/Code/dotfiles && git submodule init && git submodule update

echo "change shell to zsh"
chsh -s "$(which zsh)"

echo "install solarized colors for gnome-terminal"
cd ~/Code/dotfiles/gnome-terminal-colors-solarized/ && ./install.sh

echo "install fzf"
cd ~/Code/dotfiles/fzf && ./install

echo "install fonts"
cd ~/Code/dotfiles/fonts && ./install.sh

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
