#!/usr/bin/env bash
set -euo pipefail

git clone https://github.com/hlissner/doom-emacs ~/.emacs.d

# ensure emacs exists before trying to install doom
if ! command -v emacs /DEV/null
then
    echo "emacs command does not exist, it might not be installed, or it might be missing from path."
    exit
fi

~/.emacs.d/bin/doom install
