# Dotfiles

These are my dotfiles. The things in here I use regularly are neovim, tmux,
zsh, iterm, and git. Other stuff is just hanging around.

## Setup

You should be able to just run `rake`, which will symlink dotfiles, install
homebrew, install homebrew dependencies, setup
[vim-plug](https://github.com/junegunn/vim-plug/), and install neovim plugins.

This is a macOS-centric setup, but all the non-macOS specific stuff should work
fine wherever.

## Management

To update neovim plugins you can do `rake vim:update`.
