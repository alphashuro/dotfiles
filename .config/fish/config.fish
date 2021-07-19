if status is-interactive
  # autojump init
  [ -f /usr/local/share/autojump/autojump.fish ]; and source /usr/local/share/autojump/autojump.fish
  #asdf init
  [ -f /usr/local/opt/asdf/asdf.fish ]; and source /usr/local/opt/asdf/asdf.fish
  #nix init
  if test -e '/Users/alpha/.nix-profile/etc/profile.d/nix.sh'
    fenv source '/Users/alpha/.nix-profile/etc/profile.d/nix.sh'
  end
  # thefuck init
  thefuck --alias | source
  # direnv init (with asdf)
  asdf exec direnv hook fish | source
  function direnv
    asdf exec direnv $argv
  end

  set -x FZF_DEFAULT_COMMAND 'fd --type f --hidden --follow --exclude .git'
  set -x XDG_CONFIG_HOME $HOME/.config
  set -x GPG_TTY (tty)
end

