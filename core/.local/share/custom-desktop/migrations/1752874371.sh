echo "Add Catppuccin Latte light theme"

if [[ ! -L "~/.config/custom-desktop/themes/catppuccin-latte" ]]; then
  ln -snf ~/.local/share/custom-desktop/themes/catppuccin-latte ~/.config/custom-desktop/themes/
fi
