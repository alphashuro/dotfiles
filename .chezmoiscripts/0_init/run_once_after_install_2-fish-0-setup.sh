#!/bin/bash

fish_path=$(which fish)

if ! grep -q $fish_path "/etc/shells"; then
  echo $fish_path | sudo tee -a /etc/shells
fi

chsh -s $fish_path
