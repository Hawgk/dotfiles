#!/bin/bash

# Script for checking battery status

ID=69421
OLD_BATTERY_STATUS="None"

while true; do
    BATTERY_STATUS=$(cat /sys/class/power_supply/BAT0/status)
    echo $BATTERY_STATUS
    if [[ $OLD_BATTERY_STATUS != $BATTERY_STATUS ]]; then
	if [[ $BATTERY_STATUS == "Charging" ]]; then
	    DUNST_STRING="Battery is charging"
	elif [[ $BATTERY_STATUS == "Discharging" ]]; then
	    DUNST_STRING="Battery is discharging"
	fi
	echo $DUNST_STRING
	if [[ $BATTERY_STATUS == "Charging" || $BATTERY_STATUS == "Discharging" ]]; then
	    dunstify -r "$ID" "$DUNST_STRING"
	fi
    fi
    OLD_BATTERY_STATUS=$BATTERY_STATUS
    sleep 1
done
