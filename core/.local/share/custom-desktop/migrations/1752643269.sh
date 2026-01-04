echo "Add new matte black theme"

if [[ ! -L "~/.config/custom-desktop/themes/matte-black" ]]; then
  ln -snf ~/.local/share/custom-desktop/themes/matte-black ~/.config/custom-desktop/themes/
fi
