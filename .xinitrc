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

# swap cpaslock with escape
exec setxkbmap -option caps:swapescape &

exec xset r rate 300 50 &
exec numlockx on &
setxkbmap -layout 'us,ara' -variant altgr-intl,qwerty -option 'grp:alt_shift_toggle' &
exec nitrogen --restore &
exec dbus-launch dunst --config ~/.config/dunst/dunstrc &
mpd &

# start picom
if [ -f /usr/bin/picom ]; then
  exec picom --experimental-backends --config ~/.config/picom/picom.conf &
fi

exec dwm
