# dotfiles

All dependencies use names from arch linux's repositories (official and AUR).
AUR dependencies are installed using yay, you can use a different AUR helper or install those packages manually if desired.

Warning: These are not general use configs. Some of them are specifically designed to work well with my hardware or other software that I use so some parts may not work without modification.

# Hyprland

## Dependencies
Required:
`sudo pacman -S hyprland`
Optional:
`sudo pacman -S dunst swww waybar python-pywal gthumb`
`yay -S polychromatic`
```
dunst: notifications
swww: wallpaper setter
waybar: info bar
python-pywal: set colours based on wallpaper
polychromatic: sets lighting for razer devices
gthumb: easy way to set tags for wallpapers
```

## Wallpaper
Wallpapers are chosen at random from `~/.config/hypr/current-wallpapers` these can be images or symlinks to images.

`~/.config/hypr/wallpaper.sh` is the script used to set a wallpaper and change colours of several different things to the colours pywal generates from the wallpaper. This script can be executed manually or with the default keyboard shortcut `Mod4+F2`

`~/.config/hypr/choose-wallpapers.sh` is a script used to choose possible wallpapers based on gthumb tags. It can be invoked manually and will ask for "include words" which are the tags the images selected must have and "exclude words" which are the tags the image cannot have. It will then create symlinks in `~/.config/hypr/current-wallpapers/` to the original images.

It looks for images in `~/Images/` and their tags in `~/Images/.comments`. Each image in `~/Images/` should have a corresponding file in `~/Images/.comments/`, this file will have the same name as the image but with `.xml` appended on the end.

Example `.xml` file where tags are `digital-art` and `wallpaper`:
```xml
<?xml version="1.0" encoding="UTF-8"?>
<comment version="3.0">
  <caption/>
  <note/>
  <place/>
  <categories>
    <category value="digital-art"/>
    <category value="wallpaper"/>
  </categories>
</comment>
```

## Colours
Colours are generated with `~/.config/hypr/wallpaper.sh` using pywal. Pywal then creates `~/.cache/wal/colours-hyprland.conf`.

Note: this requires `~/.config/wal/templates/colors-hyprland.conf`

## Monitors
Monitor setup is located in `~/.config/hypr/monitors/monitors.conf`.
See [Hyprland Documentation](https://wiki.hyprland.org/Configuring/Monitors/) for information on how to set this up.

TODO:
* Setup instructions for all configs that do not work out of the box
* Add files that are linked to
