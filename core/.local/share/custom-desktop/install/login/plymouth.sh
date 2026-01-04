if [ "$(plymouth-set-default-theme)" != "omarchy" ]; then
  sudo cp -r "$HOME/.local/share/custom-desktop/default/plymouth" /usr/share/plymouth/themes/custom-desktop/
  sudo plymouth-set-default-theme omarchy
fi
