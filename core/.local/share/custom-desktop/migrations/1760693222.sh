echo "Use explicit timezone selector when right-clicking on clock"

sed -i 's/custom-desktop-cmd-tzupdate/custom-desktop-launch-floating-terminal-with-presentation omarchy-tz-select/g' ~/.config/waybar/config.jsonc
