# ~/.zshrc
autoload -U colors && colors

# Prompt with git status
source ~/git/zsh-git-prompt/zshrc.sh
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
alias randbg='/home/lolo/script/randbg.sh'
alias startvpn='/home/lolo/script/startvpn'
alias stopvpn='/home/lolo/script/stopvpn'
alias sb-nettraf='/home/lolo/script/sb-nettraf.sh'
alias st_style='/home/lolo/script/st.sh'
alias start='/home/lolo/script/start_server.sh'
alias died='/home/lolo/script/shutdown_server.sh'
alias ncmpcpp='/home/lolo/.config/ncmpcpp/ncmpcpp-ueberzug/ncmpcpp-ueberzug'
alias vim='nvim'
alias ID3toRIFF='~/script/ID3toRIFF.sh'

# export
export _JAVA_AWT_WM_NONREPARENTING=1

# Android
export ANDROID_HOME=~/Android/Sdk
export PATH=$PATH:$ANDROID_HOME/platform-tools
