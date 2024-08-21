#!/bin/bash

if [ $(pgrep wayvnc) = ""]; then
  if [ $(hyprctl monitors | grep HEADLESS) != ""]; then
    hyprctl output create headless HEADLESS
  fi
  wayvnc --disable-input --max-fps=60 &
  wayvncctl output-set "HEADLESS"
  notify-send "wayvnc started"
else
  killall -q wayvnc
  # hyprctl output remove HEADLESS
  notify-send "wayvnc killed"
fi

# For some reason creating and removing headless display several times makes wayvnc crash

