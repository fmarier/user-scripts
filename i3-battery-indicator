#!/bin/bash
#
# from https://gist.github.com/shivanshuag/8648921

SLEEP_TIME=5   # Default time between checks.
SAFE_PERCENT=30  # Still safe at this level.
DANGER_PERCENT=15  # Warn when battery at this level.

NAGBAR_PID=0
export DISPLAY=:0.0

function launchNagBar {
    i3-nagbar -m 'Battery low!' &
    NAGBAR_PID=$!
}

function killNagBar {
    if [[ $NAGBAR_PID -ne 0 ]]; then
        # shellcheck disable=SC2009
        ps -p "$NAGBAR_PID" | grep "i3-nagbar"
        if [[ $? -eq 0 ]]; then
            kill "$NAGBAR_PID"
        fi
        NAGBAR_PID=0
    fi
}

while true; do

    killNagBar

    if acpi -b | grep -q -i discharging ; then
        rem_bat=$(acpi -b | grep -Eo "[0-9]+%" | grep -Eo "[0-9]+")

        if [[ $rem_bat -gt $SAFE_PERCENT ]]; then
            SLEEP_TIME=10
        else
            SLEEP_TIME=5
            if [[ $rem_bat -le $DANGER_PERCENT ]]; then
                SLEEP_TIME=2
                launchNagBar
            fi
        fi
    else
        SLEEP_TIME=10
    fi

    sleep ${SLEEP_TIME}m

done
