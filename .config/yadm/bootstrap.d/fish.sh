fish_vi_key_bindings

if not command -v fish
   echo "fish shell is not installed. Cannot set default shell."
end

fish_path=(which fish)

if not cat /etc/shells | grep -q fish
   echo $fish_path >> /etc/shells
end

chsh -s $fish_path
