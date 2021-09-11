#!/usr/bin/env bash
set -euo pipefail

mkdir -p -m 0700 ~/.gnupg

switch uname
  case "Darwin"
    echo pinentry-program (which pinentry-mac) | tee ~/.gnupg/gpg-agent.conf
end

pkill -TERM gpg-agent
