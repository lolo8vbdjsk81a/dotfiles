#!/bin/zsh
mkdir -p ~/.config
mkdir -p ~/.config/nvim
mkdir -p ~/.config/fcitx5
mkdir -p ~/.config/hypr

stow --adopt .
git restore .

# Source zshrc to get environment variables
source ~/.zshrc

# $WM is defined in .zshrc
if [ "${WM}" != "dwm" ] && [ -f ~/.xinitrc ]; then
	unlink ~/.xinitrc
fi

if [ "${WM}" != "hyprland" ] && [ -d ~/.config/hypr ]; then
    rm -r ~/.config/hypr
fi
