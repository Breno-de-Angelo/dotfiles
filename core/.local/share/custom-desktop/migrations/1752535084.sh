echo "Set a default fontconfig"

if [[ ! -f "$HOME/.config/fontconfig/fonts.conf" ]]; then
  mkdir -p ~/.config/fontconfig
  cp ~/.local/share/custom-desktop/config/fontconfig/fonts.conf ~/.config/fontconfig/
  fc-cache -fv
fi
