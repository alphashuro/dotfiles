if status is-interactive
    set fish_greeting
    set -x EDITOR nvim
end

fenv source $HOME/.nix-profile/etc/profile.d/hm-session-vars.sh

