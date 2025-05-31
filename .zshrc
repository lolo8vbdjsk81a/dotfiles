# ~/.zshrc
autoload -U colors && colors

# WM detection function
# Only detects dwm and hyprland for now
detect_wm() {
	local wm=""
	if [ "$XDG_SESSION_TYPE" = "wayland" ]; then
		if pgrep -x "hyprland" >/dev/null; then
            wm="hyprland"
        fi
	elif [ -n "$DISPLAY" ]; then
		if pgrep -x "dwm" >/dev/null; then
			wm="dwm"
		fi
	fi

	echo "$wm"
}

# Prompt with git status
source /usr/lib/zsh-git-prompt/zshrc.sh
PS1=' < %B%F{43}󰣇 %f%b %B%F{193}%n%f%b %B@%b %B%F{43}%m%f%b %B%F{11}%~%f%b $(git rev-parse --is-inside-work-tree &>/dev/null && echo "$(git_super_status)") > '

# History
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.cache/zsh/history

# Basic auto/tab complete:
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit

# vi mode
bindkey -v
export KEYTIMEOUT=1

# Load zsh-syntax-highlight
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# alias
alias exsub='/home/lolo/script/auto_extract_subtitles.sh'
alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias sb-nettraf='/home/lolo/script/sb-nettraf.sh'
alias st_style='/home/lolo/script/st.sh'
alias vim='nvim'

########## Environment variables ##########
export WM=$(detect_wm)
export _JAVA_AWT_WM_NONREPARENTING=1

# Android
export ANDROID_HOME=~/Android/Sdk
export PATH=$PATH:$ANDROID_HOME/platform-tools
