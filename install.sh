#!/bin/zsh
mkdir -p ~/.config

stow .
stow --adopt .
git restore .

# Source zshrc to get environment variables
source ~/.zshrc

# $WM is defined in .zshrc
if [ "${WM}" != "dwm" ] && [ -f ~/.xinitrc ]; then
	unlink ~/.xinitrc
fi
