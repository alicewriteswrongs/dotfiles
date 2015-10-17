# Dotfiles

For the syncing of the dotfiles. There's a lot of them, most are
abandonware.

###`install.sh`

I wrote a little shellscript that sets up a fresh debian install. It
should install everything necessary, fetch git submodules, remove default
configuration files, make symlinks, build a few extensions, and run the
install scripts for a couple of things
([fzf](https://github.com/junegunn/fzf),
[gnome-solarized](https://github.com/Anthony25/gnome-terminal-colors-solarized),
and [inconsolata for powerline](https://github.com/powerline/fonts)).

It works on Debian 8 and 9 (probably).

Do something like:

```
sudo apt-get install chromium
ssh-keygen -t ecdsa -b 521 -C 'your_email@foo.bar'
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_ecdsa
```

then add your shiny new ssh key to Github, and do:

```
git clone git@github.com:aliceriot/dotfiles.git ~/dotfiles
cd ~/dotfiles && ./install.sh
```

### Included herein:

Everything is in it's own folder now. `vimrc` and `zshrc` are modularized
because I thought the single file was getting too complicated. If you want to
look through them for things the easiest way is with a tool like
[`Ag`](https://github.com/ggreer/the_silver_searcher).

For Vim I use the [Vundle](https://github.com/gmarik/Vundle.vim) plugin
manager, so you need to install that manually first
and then run `PluginInstall` within Vim.

Everything else should just be a symlink away! Remember that's:

    ln -s ~/dotfiles/blahprogram/blahrc ~/.blahrc

Happy configuring!
