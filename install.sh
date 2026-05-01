#!/bin/sh

cutstring="DO NOT EDIT BELOW THIS LINE"
local_config="$HOME/.config"
home_config="$HOME"

ln -sf "$PWD/nvim" "$local_config/nvim"
ln -sf "$PWD/tmux" "$local_config/tmux"
ln -sf "$PWD/opencode" "$local_config/opencode"
ln -sf "$PWD/zshrc" "$home_config/.zshrc"
ln -sf "$PWD/pryrc" "$home_config/.pryrc"
ln -sf "$PWD/dircolors" "$home_config/.dircolors"
ln -sf "$PWD/gitconfig" "$home_config/.gitconfig"
ln -sf "$PWD/gitignore" "$home_config/.gitignore"
ln -sf "$PWD/aliases" "$home_config/.aliases"

mkdir -p "$HOME/.local/bin"
ln -sf "$PWD/solargraph/solargraph-docker" "$HOME/.local/bin/solargraph-docker"

# Pairing: make scripts executable
chmod +x "$PWD/tmux/pairing-connect"
chmod +x "$PWD/tmux/pairing-status"

# Pairing: install connect script to /usr/local/bin (remotepair can execute without traversing home dir)
sudo cp "$PWD/tmux/pairing-connect" /usr/local/bin/pairing-connect
sudo chown root:root /usr/local/bin/pairing-connect
sudo chmod 755 /usr/local/bin/pairing-connect

# Pairing: add remotepair to adm group so it can read /var/log/auth.log
sudo usermod -a -G adm remotepair
