#!/bin/zsh
mkdir -p ~/.config
mkdir -p ~/.config/nvim
mkdir -p ~/.config/fcitx5
mkdir -p ~/.config/hypr
mkdir -p ~/.config/waybar

stow --adopt .
git restore .

# Source zshrc to get environment variables
source ~/.zshrc

# $WM is defined in .zshrc; $WM only has two values
if [ "${WM}" != "dwm" ] && [ -f ~/.xinitrc ]; then
	unlink ~/.xinitrc
fi

if [ "${WM}" != "Hyprland" ] && [ -d ~/.config/hypr ]; then
    rm -r ~/.config/hypr
fi
