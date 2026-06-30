#!/bin/bash

FILE=/tmp/datetime
MODE_FILE=/tmp/datetime_mode

[ -f "$MODE_FILE" ] || echo "time" > "$MODE_FILE"

update() {
    mode=$(cat "$MODE_FILE")
    if [ "$mode" = "date" ]; then
        date "+%A, %B %d" > "$FILE"
    else
        date "+%I:%M %p" > "$FILE"
    fi
}

toggle() {
    mode=$(cat "$MODE_FILE")
    if [ "$mode" = "date" ]; then
        echo "time" > "$MODE_FILE"
    else
        echo "date" > "$MODE_FILE"
    fi
    update
}

trap toggle SIGUSR1

update
while true; do
    update
    sleep 1
done
