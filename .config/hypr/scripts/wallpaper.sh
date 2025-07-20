#!/bin/bash

wallpaper_dir=~/.config/hypr/current-wallpapers/
wallpaper=${1:-$(find $wallpaper_dir | sort -R | tail -n 1)}
echo $wallpaper
swww img --transition-fps 240 --transition-type grow --transition-pos bottom-right $wallpaper &
# if [ $(pgrep wayvnc) != ""]; then
#     swww img -o HEADLESS --transition-step 255 $wallpaper
# fi
# wal -n -i "$(swww query | head -n 1 | awk '{ print $8 }')"
base=$(basename $wallpaper)
echo $base
if [ -f ~/.config/wal/colorschemes/$base.json ]; then
  wal --theme ~/.config/wal/colorschemes/$base.json 
else
  wal -n -i $wallpaper 
  # cp ~/.cache/wal/colors.json ~/.config/wal/colorschemes/$base.json
fi
razer-cli -e static -c $(awk 'NR==2 {print substr($0, 2)}' ~/.cache/wal/colors) & # n is the line number to use

~/.config/hypr/scripts/reload-configs.sh
