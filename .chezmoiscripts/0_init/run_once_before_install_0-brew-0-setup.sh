#!/bin/sh

type brew >/dev/null 2>&1 && exit

NONINTERACTIVE=1 /bin/sh -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
