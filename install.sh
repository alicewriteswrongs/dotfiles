#!/bin/sh

function help () {
    echo "you can run this, or use it as a setup guide"
    echo "the dotfiles repo should already be cloned in ~/dotfiles"
    echo ""
    echo "I've defined a bunch of package groups"
    echo "after you source the file you can do"
    echo "\tinstall_tools"
    echo "\tinstall_python"
    echo "\tinstall_ruby"
    echo "\tinstall_go"
    echo "\tinstall_c_tools"
    echo "\nthere's also tools for getting set up:"
    echo "\tgenerate_ssh_key"
    echo "\tsymlink_dotfiles"
}

# this should write an environmental variable
function update() {
    sudo apt-get update
    sudo apt-get -y upgrade
}

## installation functions
## each installs a group of packages, then does any needed manual setup

function generate_ssh_key() {
    if [[ $1 ]]; then
        ssh-keygen -t ecdsa -b 521 -C $1
        eval "$(ssh-agent -s)"
        ssh-add ~/.ssh/id_ecdsa
    else
        echo "provide an email to use"
    fi
}

#common userspace tools
function install_tools() {
    update
    sudo apt-get -y install vim-gnome tmux zsh nodejs-legacy npm silversearcher-ag htop mpd git exuberant-ctags virtualbox vagrant mupdf transmission-daemon redshift-gtk scrot
}

function install_i3() {
    update
    sudo apt-get install suckless-tools i3-wm

    git clone https://github.com/Airblader/i3.wiki.git ~/Code/
    cd ~/Code/i3-gaps
    git checkout gaps && git pull
    make
    sudo make install
    mkdir ~/.i3
    ln -s ~/dotfiles/i3/i3config ~/.i3/config
}

function install_vagrant() {
    update
    sudo apt-get install virtualbox vagrant nfs-common nfs-kernel-server portmap 
    sudo service rpcbind start
    sudo service nfs-kernel-server start
}

#go stuff
function install_go() {
    update
    sudo apt-get -y install golang-go
}

#ruby things
function install_ruby() {
    update
    gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3
    gpg --keyserver hkp://pool.sks-keyservers.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3
    \curl -sSL https://get.rvm.io | bash -s stable
    sudo apt-get -y install ruby rbenv
}

#python things
function install_python() {
    update
    sudo apt-get -y install python3-dev python-pip python3-pip python-virtualenv python-setuptools python3-setuptools
}

#libraries and build dependencies for C stuff
function install_c_tools() {
    update
    sudo apt-get -y install build-essential autoconf libboost1.55-dev-all libboost1.55-dev libboost1.55-tools-dev scons libgdbm libgdbm-dev libncurses5 libncurses5-dev automake libtool bison pkg-config cmake libreadline6 libreadline6-dev libyaml libyaml-dev libsqlite3 libsqlite3-dev sqlite3 libffi libffi-dev libpq libpq-dev notmuch libnotmuch3 libnotmuch-dev libglibmm-2.4-dev libgtkmm-3.0-1 libgtkmm-3.0-dev libgmime-2.6-0 libgmime-2.6-dev libwebkitgtk-3.0-0 libwebkitgtk-3.0-dev libwebkit-dev g++
}

#gpg stuff
function install_security_tools() {
    update
    sudo npm install -g keybase
    sudo apt-get install tor torbrowser-launcher
    sudo apt-get install openssl libcurl3 libxml2 libssl-dev libxml2-dev libcurl4-openssl-dev pinentry-curses xclip
    git clone git@github.com:lastpass/lastpass-cli.git ~/Code/
    cd ~/Code/lastpass-cli && make && sudo make install
    echo "now login to lastpass and keybase!"
}

function symlink_dotfiles() { # does a bit more, besides!
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

    echo "get vim plugins"
    git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
    echo "install vim pluings"
    vim +PluginInstall +qall && python ~/.vim/bundle/youcompleteme/install.py

    source ~/.zshrc
}

echo "now, log in to keybase!"
echo ""
echo "gnome-terminal also needs some manual config :("
echo ""
echo "you're done!"
