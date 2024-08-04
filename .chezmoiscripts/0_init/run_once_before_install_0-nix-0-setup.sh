#!/bin/sh

type nix >/dev/null 2>&1 && exit

sh <(curl -L https://nixos.org/nix/install) --daemon
