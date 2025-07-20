#!/bin/sh

read -p "New name: " -a name
hyprctl dispatch renameworkspace $(hyprctl activeworkspace | awk 'NR==1 { print $3 }') ${name}
