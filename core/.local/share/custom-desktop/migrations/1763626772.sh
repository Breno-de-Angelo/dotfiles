echo "Make hackerman available as new theme"

if [[ ! -L ~/.config/custom-desktop/themes/hackerman ]]; then
  rm -rf ~/.config/custom-desktop/themes/hackerman
  ln -nfs ~/.local/share/custom-desktop/themes/hackerman ~/.config/custom-desktop/themes/
fi
