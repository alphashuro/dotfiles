#!/bin/sh

sudo -A sh -c '\
  tailscale up; \
  ln -sf ~/.config/keyd /etc/keyd; \
  '
