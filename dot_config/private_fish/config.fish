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


  set init_files \
    "$brew_dir/share/autojump/autojump.fish" \
    "$brew_dir/opt/asdf/asdf.fish" \
    # "$HOME/.nix-profile/etc/profile.d/nix.sh"

  for file in $init_files
    if test -f $file
      source $file
    else
      echo "init file not found: $file"
    end
  end

  set -x EDITOR nvim
  set -x FZF_DEFAULT_COMMAND 'fd --type f --hidden --follow --exclude .git'
  set -x XDG_CONFIG_HOME $HOME/.config
  set -x GPG_TTY (tty)
end


# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/alphashuro/Developer/tools/google-cloud-sdk/path.fish.inc' ]; . '/Users/alphashuro/Developer/tools/google-cloud-sdk/path.fish.inc'; end

# disable greeting line
set fish_greeting

fish_add_path /usr/local/sbin
fish_add_path ~/.local/bin

# use vmware as default platform for vagrant
set VAGRANT_DEFAULT_PROVIDER vmware_fusion
set HOMEBREW_NO_AUTO_UPDATE 1
