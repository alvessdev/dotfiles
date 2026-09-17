sudo pacman -S noctalia ttf-iosevkaterm-nerd --needed --noconfirm
rm -rf ~/.config/noctalia &> /dev/null
stow -d ~/dotfiles/ noctalia
cat ~/.config/noctalia/config.toml | sed "s/arcus/$(whoami)/g" > ~/.config/noctalia/config.toml
