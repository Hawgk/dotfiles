#!/bin/bash

# Script for setting volume capped to MAX_VOLUME

ID="69420"
INTERVAL=5
MIN_VOLUME=0
MAX_VOLUME=120
CURRENT_VOLUME=$(pactl list sinks | grep '^[[:space:]]Volume:' | head -n $(( $SINK + 1 )) | tail -n 1 | sed -e 's,.* \([0-9][0-9]*\)%.*,\1,')

VOLUME_STRING="Volume"
SOUND_STRING="Sound"

if [[ $1 == "-i" ]]; then
    NEW_VOLUME=$((CURRENT_VOLUME + INTERVAL))
    if [[ NEW_VOLUME -le MAX_VOLUME ]]; then
	pactl set-sink-volume 0 +${INTERVAL}% > /dev/null
	DUNST_STRING="${VOLUME_STRING} increased to ${NEW_VOLUME}%"
    else
	DUNST_STRING="Maximum volume reached"
    fi
elif [[ $1 == "-d" ]]; then
    NEW_VOLUME=$((CURRENT_VOLUME - INTERVAL))
    if [[ NEW_VOLUME -ge MIN_VOLUME ]]; then
	pactl set-sink-volume 0 -${INTERVAL}% > /dev/null
	DUNST_STRING="${VOLUME_STRING} decreased to ${NEW_VOLUME}%"
    else
	DUNST_STRING="Minimum volume reached"
    fi
elif [[ $1 == "-m" ]]; then
    MUTED=$(pacmd list-sinks | awk '/muted/ { print $2 }')
    pactl set-sink-mute 0 toggle
    if [[ $MUTED == "yes" ]]; then
	DUNST_STRING="${SOUND_STRING} unmuted"
    else
	DUNST_STRING="${SOUND_STRING} muted"
    fi
fi

# Notification
if [[ $1 == "-i" || $1 == "-d" || $1 == "-m" ]]; then
    dunstify -r "$ID" "$DUNST_STRING"
fi 
