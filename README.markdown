# Dotfiles

For the syncing of the dotfiles. For the sake of consistency try to always clone in:

`~/Code/dotfiles`

the setup is dependent on this, for sourcing modular vimrc and zshrc files.

------------------

###`install.sh`

I wrote a little shellscript that sets up a fresh debian install. It
should install everything necessary, fetch git submodules, remove default
configuration files, make symlinks, build a few extensions, and run the
install scripts for a couple of things
([fzf](https://github.com/junegunn/fzf),
[gnome-solarized](https://github.com/Anthony25/gnome-terminal-colors-solarized),
and [inconsolata for powerline](https://github.com/powerline/fonts)).

It works on Debian 8 and 9 (probably).

### Included herein:

Everything is in it's own folder now. `vimrc` and `zshrc` are modularized
because I thought the single file was getting too complicated. If you want to
look through them for things the easiest way is with a tool like
[`Ag`](https://github.com/ggreer/the_silver_searcher).

For Vim I use the [Vundle](https://github.com/gmarik/Vundle.vim) plugin
manager, so you need to install that manually first
and then run `PluginInstall` within Vim.

Everything else should just be a symlink away! Remember that's:

    ln -s ~/Code/dotfiles/blahprogram/blahrc ~/.blahrc

Happy configuring!
