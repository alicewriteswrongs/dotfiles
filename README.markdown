# Dotfiles

For the syncing of the dotfiles. There's a lot of them, most are
abandonware. Things I use actively:

* `zsh`
* `vim`
* `i3`
* `git`
* `tmux`

###`install.sh`

I originally wrote a little shellscript in order to set up a fresh Debian
install, which I started modifying to keep track of esoteric configuration
setup steps, and eventually it turned into collection of functions for
installing and configuring various things.

There's functions to install Python, Ruby, C, and Go stuff, get the common
userspace tools I like, and do all the necessary steps (fetch git
submodules, remove default configuration files, make symlinks, build a few
extensions, and run the install scripts for a couple of things like
[fzf](https://github.com/junegunn/fzf),
[gnome-solarized](https://github.com/Anthony25/gnome-terminal-colors-solarized),
and [inconsolata for powerline](https://github.com/powerline/fonts)) to
get my dev environment the way I like it.

Anyway, you may find it helpful! I use Debian testing, but I imagine it
should work ok (or at least give you a starting off point) for any other
Debian-related distro (ubuntu, etc).

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
