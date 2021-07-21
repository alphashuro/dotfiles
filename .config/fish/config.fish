if status is-interactive
  set -x app_dir (brew --prefix)

  # autojump init
  [ -f $app_dir/share/autojump/autojump.fish ]; and source $app_dir/share/autojump/autojump.fish
  #asdf init
  [ -f $app_dir/opt/asdf/asdf.fish ]; and source $app_dir/opt/asdf/asdf.fish
  #nix init
  [ -e "$HOME/.nix-profile/etc/profile.d/nix.sh" ]; and fenv source "$HOME/.nix-profile/etc/profile.d/nix.sh"
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

