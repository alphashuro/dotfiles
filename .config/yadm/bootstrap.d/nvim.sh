if command -v nvim >/dev/null 2>&1; then
  echo "Bootstraping neovim"
  vim '+PackerInstall' '+PackerClean!' '+PackerUpdate' '+qall'
fi
