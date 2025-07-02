if [[ "$(tty)" == "/dev/tty1" ]] && [[ -z "$DISPLAY" ]]; then
    exec dbus-run-session Hyprland
fi
