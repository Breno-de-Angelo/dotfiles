# Copy over Omarchy configs
mkdir -p ~/.config
cp -R ~/.local/share/custom-desktop/config/* ~/.config/

# Use default bashrc from Omarchy
cp ~/.local/share/custom-desktop/default/bashrc ~/.bashrc
