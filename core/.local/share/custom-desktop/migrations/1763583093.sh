echo "Make ethereal available as new theme"

if [[ ! -L ~/.config/custom-desktop/themes/ethereal ]]; then
  rm -rf ~/.config/custom-desktop/themes/ethereal
  ln -nfs ~/.local/share/custom-desktop/themes/ethereal ~/.config/custom-desktop/themes/
fi
