#!/bin/bash

print_step() {
	echo
	echo -e "\e[32m* $1\e[0m"
}

# Update
print_step "Update system"
sudo pacman -Syu --noconfirm

# Install dependencies
print_step "Install requirements"
sudo pacman -S --needed --noconfirm \
	hyprland \
	waybar \
	hyprshot \
	hyprlock \
	hypridle \
	hyprpaper \
	hyprpicker \
	wofi \
	swaync \
	thunar \
	ranger \
	pavucontrol \
	brightnessctl \
	otf-font-awesome \
	ttf-cascadia-mono-nerd \
	pamixer \
	cliphist \
	flatpak \
	btop \
	tmux \
	neovim \
	stow \
	emacs \
	alacritty \
	qutebrowser \
	fastfetch \
	lazygit \
	podman \
	distrobox \
	remmina

# Install dependencies and convenient programs as flatpaks
print_step "Install flatpaks"
flatpak install --or-update -y io.github.flattool.Warehouse
flatpak install --or-update -y it.mijorus.gearlever
flatpak install --or-update -y com.github.tchx84.Flatseal
flatpak install --or-update -y io.github.ungoogled_software.ungoogled_chromium
flatpak install --or-update -y io.freetubeapp.FreeTube
flatpak install --or-update -y app.zen_browser.zen
flatpak install --or-update -y com.brave.Browser

