# dotfiles
My personal Arch Linux dotfiles.

Managed with [GNU Stow](https://www.gnu.org/software/stow/).

## Included
- Zsh configuration
- Git configuration and aliases
- Hyprland configuration
- Waybar configuration
- Neovim configuration
- Fcitx5 input-method configuration
- X11/dwm startup configuration

## Install
Install GNU Stow:
```bash
sudo pacman -S stow
```

Clone this repository:
```sh
git clone [https://github.com/lolo8vbdjsk81a/dotfiles.git](https://github.com/lolo8vbdjsk81a/dotfiles.git) ~/.dotfiles
cd ~/.dotfiles
```

Create symlinks in your home directory:
```sh
stow -t "$HOME" .
```

