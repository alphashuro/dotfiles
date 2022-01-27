#!/bin/bash

# install brew
if ! command -v brew /dev/null
then
	/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# install brew packages
brew bundle install --file=~/Brewfile

brew services start goku

# install doom emacs
# ensure emacs exists before trying to install doom
if ! command -v emacs /DEV/null
then
    echo "emacs command does not exist, it might not be installed, or it might be missing from path."
    exit
else
    git clone https://github.com/hlissner/doom-emacs ~/.emacs.d
    ~/.emacs.d/bin/doom install
fi

# setup fish
if ! command -v fish
then
    echo "fish shell is not installed. Cannot set default shell."
else
    fish_bath=$(which fish)
    if ! cat /etc/shells | grep -q fish
    then
        echo $fish_path >> /etc/shells
    fi

    chsh -s $fish_path

    fish -c 'fish_vi_key_bindings'
fi

if ! command -v fisher
	curl -sL https://git.io/fisher | source && fisher install jorgebucaran/fisher
fi

if command -v nvim >/dev/null 2>&1
then
  echo "Bootstraping neovim"
  nvim --headless '+PackerInstall' '+PackerClean!' '+PackerUpdate' '+qall'
fi

