echo "Make new Osaka Jade theme available as new default"

if [[ ! -L ~/.config/custom-desktop/themes/osaka-jade ]]; then
  rm -rf ~/.config/custom-desktop/themes/osaka-jade
  git -C ~/.local/share/custom-desktop checkout -f themes/osaka-jade
  ln -nfs ~/.local/share/custom-desktop/themes/osaka-jade ~/.config/custom-desktop/themes/osaka-jade
fi
