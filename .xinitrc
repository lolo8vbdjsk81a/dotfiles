#!/bin/sh
userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap

# merge in defaults and keymaps
if [ -f $sysresources ]; then
    xrdb -merge $sysresources
fi

if [ -f $sysmodmap ]; then
    xmodmap $sysmodmap
fi

if [ -f "$userresources" ]; then
    xrdb -merge "$userresources"
fi

if [ -f "$usermodmap" ]; then
    xmodmap "$usermodmap"
fi

# start some nice programs
if [ -d /etc/X11/xinit/xinitrc.d ] ; then
    for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
        [ -x "$f" ] && . "$f"
    done
unset f
fi

# Keyboard Layout
setxkbmap us &

# Display Resolution
xrandr --output DP-3 --mode 1920x1080 --rate 60 --rotate right &
xrandr --output DP-0 --mode 1920x1080 --rate 144 --rotate normal --primary &

# Compositor
# picom -f &

# Audio
/usr/bin/pipewire &
/usr/bin/pipewire-pulse &
/usr/bin/pipewire-media-session &

# Container

# Others
fcitx5 &
xbindkeys &
xmousepasteblock &

# dwmbar
dte(){
    dte="$(date +"%a %H:%M %D")"
    echo -e "$dte"
}

mem() {
    mem="$(neofetch uptime memory | awk 'NR==2{printf " %s/%sMB (%.2f%%)", $2+0,$4+0, $2*100/$4}')"
    echo -e "$mem"
}

mem() {
	mem="$(free --mega | awk '/Mem/{printf " %s/%sMB (%d%%)", $3, $2, $3*100/$2}')"
	echo -e "$mem"
}

cpu() {
    cpu="$(sensors | awk '/CPU/{printf " "substr($2, 2)}')"
    echo -e "$cpu"
}

bat() {
    bat="$(acpi | awk 'NR==2{printf " "substr($4, 0, 3)}')"
    echo -e "$bat"
}

vpn() {
    vpn="$(mullvad status | awk '{printf " " toupper(substr($3, 1, 2))}')"
    echo -e "$vpn"
}

#vol() {
#    vol="$()"

while :; do
    xsetroot -name " $(bat) | $(cpu) | $(mem) | $(dte) "
    sleep 2s
done &

# Loop
#while true; do
#    dwm >/dev/null 2>&1
#done

exec dwm
