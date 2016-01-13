#!/bin/bash

# mailing lists
notmuch tag +LPC -- subject:"[lpc-c]"
notmuch tag +LPC -- to:lpc-c@masses.tao.ca
notmuch tag +crypto -- subject:"[Cryptography]"
notmuch tag +crypto -- to:cryptography@metzdowd.com
notmuch tag +crypto -- to:messaging@moderncrypto.org
notmuch tag +crypto -- to:cryptography@randombit.net
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
notmuch tag +Julia -- to:julia-users@googlegroups.com
notmuch tag +kernel_newbies -- to:kernelnewbies@kernelnewbies.org
notmuch tag +Arch -- to:arch-general@archlinux.org
notmuch tag +blackandpink -- to:blackandpinkboston-courtsupport@googlegroups.coms
notmuch tag +nylug -- to:nylug-talk@nylug.org

# notifications and so on
notmuch tag +github_notification -- from:notifications@github.com
notmuch tag +EFF -- from:editor@eff.org

# work! school!
notmuch tag +bookbub -- to:alice@bookbub.com
notmuch tag +BU -- to:benpote@bu.edu

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
skip_inbox_from info@bookbub.com
skip_inbox_from info@twitter.com
skip_inbox_to staging_desk@bookbub.com
skip_inbox_to ben.pote@gmail.com
skip_inbox_from kernelnewbies@kernelnewbies.org
skip_inbox_from noreply@newrelic.com
skip_inbox_from notifier@qbox.io
skip_inbox_from notifications@myprewards.com
skip_inbox_from notifications@github.com
skip_inbox_from cloudsuspensions@trustedproxies.com
skip_inbox_from info@trustedproxies.com
skip_inbox_to *@cic.us
skip_inbox_to julia-users@googlegroups.com
skip_inbox_from happiness@tinypulse.com
skip_inbox_from maildelivery@freshbooks.com
skip_inbox_from store-news@amazon.com
skip_inbox_to bio-ebe-list@list-dist.bu.edu
skip_inbox_to benpote@bu.edu
skip_inbox_from vfe-campaign-response@amazon.com
skip_inbox_to kernelnewbies@kernelnewbies.org
