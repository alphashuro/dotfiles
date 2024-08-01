if status is-interactive
  switch (uname)
    case "Darwin"
      switch (uname -m)
        case "arm64"
          # M1 macs put brew here
          # and I have to add it to path in case I have multiple users
          eval (/opt/homebrew/bin/brew shellenv)
      end
  end

  set -x brew_dir (brew --prefix)
  set -x EDITOR nvim
  set -x FZF_DEFAULT_COMMAND 'fd --type f --hidden --follow --exclude .git'
  set -x XDG_CONFIG_HOME $HOME/.config
  set -x GPG_TTY (tty)
end

# disable greeting line
set fish_greeting

fish_add_path /usr/local/sbin
fish_add_path ~/.local/bin
fish_add_path ~/bin
