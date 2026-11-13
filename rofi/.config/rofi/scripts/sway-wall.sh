#!/usr/bin/env bash

# Directory containing your wallpapers
WALL_DIR="$HOME/Pictures/Wallpapers"

# Check if directory exists
if [ ! -d "$WALL_DIR" ]; then
    notify-send "Wallpaper Picker" "Directory $WALL_DIR not found."
    exit 1
fi

# Find images and format them with icons for rofi.
# The full path is used as the rofi value, the filename as the display text.
SELECTED=$(find "$WALL_DIR" -type f \( -iname "*.jpg" -o -iname "*.jpeg" -o -iname "*.png" -o -iname "*.webp" \) | while read -r img; do
    echo -en "$img\0icon\x1f$img\n"
done | rofi -dmenu -i -p "󰸉 Wallpapers" -theme-str 'configuration { show-icons: true; } listview { columns: 3; lines: 3; } element { orientation: vertical; } element-icon { size: 120px; }')

# If an image was picked, hand it to awww (started by the sway config).
# Fall back to swaybg when the daemon is not running.
if [ -n "$SELECTED" ]; then
    if pgrep -x awww-daemon >/dev/null 2>&1; then
        awww img "$SELECTED"
    else
        pkill swaybg
        swaybg -m fill -i "$SELECTED" &
    fi
fi
