#!/bin/bash
mkdir -p ~/.config

# First
ln -s ~/.dotfiles/.zshrc ~/.zshrc
ln -s ~/.dotfiles/.bashrc ~/.bashrc

# Source zshrc to get $WM variable
source ~/.zshrc

# $WM is defined in .zshrc
if [ "${WM}" = "dwm" ]; then
	ln -s ~/.dotfiles/.xinitrc ~/.xinitrc
fi

ln -s ~/.dotfiles/.gitconfig ~/.gitconfig
ln -s ~/.dotfiles/.config/nvim ~/.config
