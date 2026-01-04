echo "Add the new Flexoki Light theme"

if [[ ! -L ~/.config/custom-desktop/themes/flexoki-light ]]; then
  ln -nfs ~/.local/share/custom-desktop/themes/flexoki-light ~/.config/custom-desktop/themes/
fi
