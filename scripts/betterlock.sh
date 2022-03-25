#!/bin/sh

# checks to see if i3lock is already running before running i3lock
if [[ $(pgrep i3lock) ]]; then 		# if i3lock is running, do nothing
	exit
else 					# if i3lock is not running, run it
	
	tmpbg="/tmp/screen.png"
	scrot "$tmpbg"; corrupter "$tmpbg" "$tmpbg"
	i3lock -uenfi "$tmpbg"; rm "$tmpbg"
fi
