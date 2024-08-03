#!/bin/bash

curl https://raw.githubusercontent.com/oh-my-fish/oh-my-fish/master/bin/install \
  | NONINTERACTIVE=1 fish

fish -c 'omf install'

sudo ln -si $(which fish) /usr/local/bin/fish

if ! grep -q fish "/etc/shells"; then
  echo /usr/local/bin/fish | sudo tee -a /etc/shells
fi

chsh -s /usr/local/bin/fish
