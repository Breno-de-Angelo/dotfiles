echo "Link new theme picker config"

mkdir -p ~/.config/elephant/menus
ln -snf $OMARCHY_PATH/default/elephant/custom-desktop_themes.lua ~/.config/elephant/menus/custom-desktop_themes.lua
sed -i '/"menus",/d' ~/.config/walker/config.toml
omarchy-restart-walker
