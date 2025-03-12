#!/bin/bash
killall -q waybar
killall -q dunst

# Path to css @define-color files
waybar_colors="$HOME/.cache/wal/colors-waybar.css"

# Path to the waybar template and output CSS
waybar_template="$HOME/.config/waybar/style-template.css"
waybar_config="$HOME/.config/waybar/style.css"

# Path to the wofi template and output config
wofi_template="$HOME/.config/wofi/style-template.css"
wofi_config="$HOME/.config/wofi/style.css"

# Path to the dunst template and output config
dunst_template="$HOME/.config/dunst/dunstrc-template"
dunst_config="$HOME/.config/dunst/dunstrc"

cat "$waybar_colors" "$waybar_template" > "$waybar_config"

cat "$waybar_colors" "$wofi_template" > "$wofi_config"

source "$HOME/.cache/wal/colors.sh"

sed -e "s/{background}/\"$background\"/g" \
    -e "s/{foreground}/\"$foreground\"/g" \
    -e "s/{color0}/\"$color0\"/g" \
    -e "s/{color1}/\"$color1\"/g" \
    -e "s/{color2}/\"$color2\"/g" \
    -e "s/{color3}/\"$color3\"/g" \
    -e "s/{color4}/\"$color4\"/g" \
    -e "s/{color5}/\"$color5\"/g" \
    -e "s/{color6}/\"$color6\"/g" \
    -e "s/{color7}/\"$color7\"/g" \
    -e "s/{color8}/\"$color8\"/g" \
    -e "s/{color9}/\"$color9\"/g" \
    -e "s/{color10}/\"$color10\"/g" \
    -e "s/{color11}/\"$color11\"/g" \
    -e "s/{color12}/\"$color12\"/g" \
    -e "s/{color13}/\"$color13\"/g" \
    -e "s/{color14}/\"$color14\"/g" \
    -e "s/{color15}/\"$color15\"/g" \
    "$dunst_template" > "$dunst_config"

waybar &
dunst &
