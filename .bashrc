#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias shutdown='/home/lolo/script/shutdown_server.sh'

export NEXTCLOUD_PHP_CONFIG=/etc/webapps/nextcloud/php.ini
export PS1="[\[\e[1;36m\]󰣇 \[\e[1;35m\]\u \[\e[1;37m\](　・ω・)⊃ \[\e[1;33m\].\W \[\e[00m\]] \$ "
