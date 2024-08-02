#!/bin/bash

curl https://raw.githubusercontent.com/oh-my-fish/oh-my-fish/master/bin/install \
  | NONINTERACTIVE=1 fish

fish -c 'omf install'
