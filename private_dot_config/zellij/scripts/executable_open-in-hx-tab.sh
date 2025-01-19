#!/bin/bash

# go to hx tab, creating it if it doesn't exist yet
zellij --layout hx action go-to-tab-name -c "hx"

zellij action write 27 # send ESC to make sure we're in mormal mode
zellij action write-chars ":open $1"
zellij action write 13 # send enter key to execute the command
