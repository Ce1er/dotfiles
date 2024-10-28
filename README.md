# dotfiles

The `$` symbol is used to show a command that should be run. `#` indicates that this command should be run as root.

WORK IN PROGRESS: setup instructions are incomplete and setup instructions already presented have not all been tested so don't expect them to work without fixing issues yourself.

All dependencies use names from arch linux's repositories (official and AUR). Other repositories will likely have similar names for projects that will probably work fine.
AUR dependencies are installed using yay, you can use a different AUR helper or install those packages manually if desired.

Warning: These are not general use configs. Some of them are specifically designed to work well with my hardware or other software that I use so some parts may not work without modification.

# General
```$ git clone https://github.com/Ce1er/dotfiles.git```

Warning: the following command may override files in `~/.config/` if they already exist, make sure you have a backup.

```$ cp -r dotfiles/* ~/.config/```

# Hyprland

## Dependencies
Required:
```# pacman -S hyprland```

Optional:
```# pacman -S dunst swww waybar python-pywal gthumb wayvnc```
```$ yay -S polychromatic```
```
dunst: notifications
swww: wallpaper setter
waybar: info bar
python-pywal: set colours based on wallpaper
polychromatic: sets lighting for razer devices
gthumb: easy way to set tags for wallpapers
wayvnc: use a second monitor through a vnc connection
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

`~/.config/hypr/reload-configs.sh`
This script will change wofi, dunst and waybar configs based on pywal colourscheme. The colours affected are explained in `~/.config/wal/colour-locations.md`
A colourscheme can be automatically generated for an image or defined manually and set with `wal --theme {path_to_colourscheme}`

## Monitors
Monitor setup is located in `~/.config/hypr/monitors/monitors.conf`.
See [Hyprland Documentation](https://wiki.hyprland.org/Configuring/Monitors/) for information on how to set this up.

### Wayvnc
Used to have a second monitor over a VNC connection.

#### Dependencies
```# pacman -S wayvnc```

#### Setup
Add a username and password to `~/.config/wayvnc/config`

Generate a key pair with openssl

Start wayvnc with `~/.config/hypr/headless-monitor.sh` this script can be invoked with the keyboard shortcut `Mod4+F4`

# Qtile

## Dependencies
Required:
```# pacman -S qtile xorg```
Not all packages from the xorg virtual package are required however I have not tested which ones are necessary.
Optional:
```# pacman -S feh picom dunst rofi kitty python-iwlib```
```$ yay -S qtile-extras```
```
feh: wallpaper tool
picom: transparent windows
dunst: notifications
rofi: app launcher
kitty: terminal emulator
qtile-extras: eye-candy
python-iwlib: wifi info in bar
```

## Setup
In `~/.config/qtile/config.py/` change default apps. These can be found under the heading:
```
# --------------------------------------------------------
# Set default apps
# --------------------------------------------------------
```
Having a terminal is required, an app launcher is highly recommended. browser and file_manager are optional although most users will use them.

# TODO
* Setup instructions for all configs that do not work out of the box
* Add files that are linked to
* Change shebangs to use `/usr/bin/env`
* Change all file paths to `~/` if username is specified

# Neovim

## Dependencies
Nvchad: https://nvchad.com/docs/quickstart/install

## Setup
1. Follow Nvchad installation instructions
2. Override files in ~/.config/nvim/* with the ones in dotfiles/.config/nvim/*
3. Update Lazy and Mason
