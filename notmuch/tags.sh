#!/bin/bash

# mailist lists
notmuch tag +LPC -- subject:"[lpc-c]"
notmuch tag +crypto -- subject:"[Cryptography]"
notmuch tag +crypto -- to:cryptography@metzdowd.com
notmuch tag +sup -- subject:"[sup]"
notmuch tag +tor -- subject:"[tor-talk]"
notmuch tag +tor -- to:tor-talk@lists.torproject.org
notmuch tag +haskell -- subject:"[Haskell]"
notmuch tag +haskell -- to:haskell@haskell.org
notmuch tag +ows -- to:whispersystems@lists.riseup.net
notmuch tag +astroid -- to:astroid@noreply.github.com
notmuch tag +boston_iww -- to:bostgmb-l@lists.iww.org
notmuch tag +BCN -- to:bcn@lists.bostoncoop.net
notmuch tag +BATS -- to:massbats@googlegroups.com
notmuch tag +BATS -- to:boston-area-trans-support@yahoogroups.com


# skip the inbox
function skip_inbox_from () {
    notmuch tag -inbox -- from:$1
}
function skip_inbox_to () {
    notmuch tag -inbox -- to:$1
}
skip_inbox_from moveon-help@list.moveon.org
skip_inbox_from semaphore+notifications@renderedtext.com
skip_inbox_from do-not-reply@trello.com
skip_inbox_from info@marighttoknow.org
skip_inbox_from update@stubhub-mail.com
skip_inbox_from noreply@coursera.org
skip_inbox_to staging_desk@bookbub.com
skip_inbox_to ben.pote@gmail.com
