echo "Add the new ristretto theme as an option"

if [[ ! -L ~/.config/custom-desktop/themes/ristretto ]]; then
  ln -nfs ~/.local/share/custom-desktop/themes/ristretto ~/.config/custom-desktop/themes/
fi
