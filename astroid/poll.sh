#!/bin/bash

# fetch new mail
offlineimap
getmail

# index it
notmuch new

# run the tags script
~/dotfiles/notmuch/tags.sh
