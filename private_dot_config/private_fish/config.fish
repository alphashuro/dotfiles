if status is-interactive
    set -U fish_greeting
    set -x EDITOR nvim

    fish_vi_key_bindings

    starship init fish | source
    zoxide init --cmd j fish | source

    alias k=kubectl
end

eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
fenv source $HOME/.nix-profile/etc/profile.d/hm-session-vars.sh

