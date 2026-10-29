#!/bin/bash

current="$(hyprctl activeworkspace | awk 'NR=1 { print $3 }' | head -n1)"
read -p "New name: " -a name
if [[ -z "${name}" ]]; then
  name=${current}
fi
hyprctl dispatch "hl.dsp.workspace.rename({workspace=${current}, name='${name}'})"
