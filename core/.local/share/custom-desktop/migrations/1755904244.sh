echo "Update fastfetch config with new Omarchy logo"

omarchy-refresh-config fastfetch/config.jsonc

mkdir -p ~/.config/custom-desktop/branding
cp $OMARCHY_PATH/icon.txt ~/.config/custom-desktop/branding/about.txt
