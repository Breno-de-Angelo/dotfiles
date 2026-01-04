echo "Replace bluetooth GUI with TUI"

omarchy-pkg-add bluetui
omarchy-pkg-drop blueberry

if ! grep -q "omarchy-launch-bluetooth" ~/.config/waybar/config.jsonc; then
  sed -i 's/blueberry/custom-desktop-launch-bluetooth/' ~/.config/waybar/config.jsonc
fi
