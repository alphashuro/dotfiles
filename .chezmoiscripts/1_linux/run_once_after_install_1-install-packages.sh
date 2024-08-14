#!/bin/sh

sudo sh -c '\
  tailscale up; \
  ln -sf ~/.config/keyd /etc/keyd; \
  '
