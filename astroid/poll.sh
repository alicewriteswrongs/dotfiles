#!/bin/bash

# fetch new mail
offlineimap
getmail --rcfile=riseup_getmail_rc
getmail --rcfile=alice_gmail_getmail_rc

# index it
notmuch new

# run the tags script
~/dotfiles/notmuch/tags.sh
