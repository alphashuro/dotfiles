#!/bin/bash

sudo -A ln -si $(which fish) /usr/local/bin/fish

if ! grep -q fish "/etc/shells"; then
  echo /usr/local/bin/fish | sudo tee -a /etc/shells
fi

chsh -s /usr/local/bin/fish
