for file in ~/.config/hypr/current-wallpapers/*; do
  base="$(basename $file)"
  actual=~/Images/Wallpapers/$base
  if  [ ! -f ~/.config/wal/colorschemes/$file.json ]; then
    wal -ntseqn -i $actual
    cp ~/.cache/wal/colors.json ~/.config/wal/colorschemes/$base.json
  fi
done
