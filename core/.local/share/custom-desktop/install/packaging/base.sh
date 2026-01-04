# Install all base packages
mapfile -t packages < <(grep -v '^#' "$OMARCHY_INSTALL/custom-desktop-base.packages" | grep -v '^$')
sudo pacman -S --noconfirm --needed "${packages[@]}"
