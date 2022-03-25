#!/bin/bash

# Script for setting the brightness level with light

ID="17583"
INTERVAL=5
MIN_LEVEL=0
MAX_LEVEL=100
BRIGHTNESS_STRING="Brightness level"

CURRENT_LEVEL_FLOAT=$(light -G)
CURRENT_LEVEL=${CURRENT_LEVEL_FLOAT:: -3}

# Increase
if [[ $1 == "-i" ]]; then
    NEW_LEVEL=$((CURRENT_LEVEL + INTERVAL))
    NEW_LEVEL_STRING="to ${NEW_LEVEL}"
    if [[ NEW_LEVEL -le MAX_LEVEL ]]; then
	light -A ${INTERVAL}
	TYPE_STRING="$BRIGHTNESS_STRING increased $NEW_LEVEL_STRING%"
    else
	TYPE_STRING="Maximum brightness reached"
    fi
# Decrease
elif [[ $1 == "-d" ]]; then
    NEW_LEVEL=$((CURRENT_LEVEL - INTERVAL))
    NEW_LEVEL_STRING="to ${NEW_LEVEL}"
    if [[ NEW_LEVEL -ge MIN_LEVEL ]]; then
        light -U ${INTERVAL}
	TYPE_STRING="$BRIGHTNESS_STRING decreased $NEW_LEVEL_STRING%"
    else
	TYPE_STRING="Minimum brightness reached"
    fi
fi

# Notification
if [[ $1 == "-i" || $1 == "-d" ]]; then
    dunstify -r "$ID" "$TYPE_STRING"
fi
