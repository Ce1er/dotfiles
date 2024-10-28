#!/bin/bash

wallpaper_dir=~/.config/hypr/current-wallpapers/
wallpaper=$(find $wallpaper_dir | sort -R | tail -n 1)
swww img -o DP-1 --transition-fps 240 --transition-type grow --transition-pos bottom-right $wallpaper
if [ $(pgrep wayvnc) != ""]; then
    swww img -o HEADLESS --transition-step 255 $wallpaper
fi
wal -n -i "$(swww query | head -n 1 | awk '{ print $8 }')"
polychromatic-cli -d keyboard --zone main -c $(sed '2q;d' ~/.cache/wal/colors) -o static # In sed command number before q is the line to use
