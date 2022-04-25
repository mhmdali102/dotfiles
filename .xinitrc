userresources=$HOME/.Xresources

if [ -f "$userresources" ]; then
    xrdb -merge "$userresources"
fi

# start some nice programs
if [ -d /etc/X11/xinit/xinitrc.d ] ; then
    for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
        # shellcheck source=/dev/null
        [ -x "$f" ] && . "$f"
    done
    unset f
fi

# Prepend a custom font path to Xorg's list of known font paths
xset +fp $HOME/.fonts 

/* nitrogen --restore & */
dbus-launch dunst --config ~/.config/dunst/dunstrc &
mpd &
nm-applet &
picom --experimental-backends &

xset r rate 300 50
numlockx on
setxkbmap -layout 'us,ara' -variant altgr-intl,qwerty -option 'grp:alt_shift_toggle'
setxkbmap -option caps:swapescape

while true 
do
  xsetroot -name "$(date '+%H:%M')"
  sleep 60
done & 

exec dwm
