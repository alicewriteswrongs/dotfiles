#!/bin/bash

function update() {
    sudo apt-get update
    sudo apt-get -y dist-upgrade
}

## installation functions
## each installs a group of packages, then does any needed manual setup

function install_elm_stuff() {
    npm install -g elm
    npm install -g elm-oracle
}
#common userspace tools
function install_tools() {
    sudo apt-get -y install vim-gnome tmux zsh silversearcher-ag htop mpd git exuberant-ctags virtualbox vagrant mupdf transmission-daemon redshift-gtk scrot redshift ssh-askpass keychain gpg_agent ssh-askpass-gnome
}

function install_notmuch() {
    sudo apt install -y notmuch libnotmuch4 libnotmuch-dev
}

function install_latex() {
    sudo apt-get install texlive-full texlive-extra-utils texlive-math-extra texlive-latex-base texlive-latex-extra cweb-latex
}

function install_i3() {
    update
    sudo apt-get install suckless-tools i3-wm i3 i3-wm-debug feh nm-applet parcellite compton xautolock xscreensaver
    sudo apt-get install libxcb1-dev libxcb-keysyms1-dev libpango1.0-dev libxcb-util0-dev libxcb-icccm4-dev libyajl-dev libstartup-notification0-dev libxcb-randr0-dev libev-dev libxcb-cursor-dev libxcb-xinerama0-dev libxcb-xkb-dev libxkbcommon-dev libxkbcommon-x11-dev
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
    source ~/.rvm/scripts/rvm
    rvm install ruby-2.2.3
    rvm use 2.2.3
    gem install bundler
    rvm rvmrc warning ignore allGemfiles
}

#python things
function install_python() {
    update
    sudo apt-get -y install python3-dev python-pip python3-pip python-virtualenv python-setuptools python3-setuptools
}

#libraries and build dependencies for C stuff
function install_c_tools() {
    update
    sudo apt-get -y install build-essential autoconf automake libtool cmake pkg-config
}

function install_c_build_deps() {
    update
    sudo apt-get -y install libboost1.55-dev-all libboost1.55-dev libboost1.55-tools-dev scons libgdbm libgdbm-dev libncurses5 libncurses5-dev bison libreadline6 libreadline6-dev libyaml libyaml-dev libsqlite3 libsqlite3-dev sqlite3 libffi libffi-dev libpq libpq-dev notmuch libnotmuch3 libnotmuch-dev libglibmm-2.4-dev libgtkmm-3.0-1 libgtkmm-3.0-dev libgmime-2.6-0 libgmime-2.6-dev libwebkitgtk-3.0-0 libwebkitgtk-3.0-dev libwebkit-dev g++
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

function generate_ssh_key() {
    if [[ $1 ]]; then
        ssh-keygen -t ecdsa -b 521 -C $1
        eval "$(ssh-agent -s)"
        ssh-add ~/.ssh/id_ecdsa
    else
        echo "provide an email to use"
    fi
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

function install_everything () {
    update
    install_tools
    install_c_tools
    install_python
    install_i3
    install_ruby
    install_go


    
    