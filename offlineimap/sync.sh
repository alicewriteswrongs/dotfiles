#!/bin/bash

PID=$(pgrep offlineimap)
LOCK=~/.lock/mail

# offlineimap freezes up a lot.  kill if previous job is still running
[[ -n "$PID" ]] && kill $PID

# sub-shell below is locked to prevent concurrency
(
	# bail early if lock is held
	flock -n 9 || exit 1

	/usr/bin/offlineimap -o -u basic | /usr/bin/logger

) 9>$LOCK

exit 0
