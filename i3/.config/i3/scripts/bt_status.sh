#!/bin/bash

while true; do
    powered=$(bluetoothctl show | grep -c "Powered: yes")
    if [ "$powered" -eq 0 ]; then
        echo "󰂲 off" > /tmp/bt_status
    else
        devices=$(bluetoothctl devices Connected)
        count=$(echo "$devices" | wc -l)
        if [ "$count" -gt 0 ] && [ -n "$devices" ]; then
            name=$(echo "$devices" | head -1 | cut -d' ' -f3-)
            echo "󰂯 $name" > /tmp/bt_status
        else
            echo "󰂱 on" > /tmp/bt_status
        fi
    fi
    sleep 5
done
