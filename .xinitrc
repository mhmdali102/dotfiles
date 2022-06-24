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

feh --bg-fill $HOME/Pictures/Wallpapers/landscape/nasa-HWIOLU7_O6w-unsplash.jpg &
/* ~/.config/i3/scripts/live-wallpaper/wallpaper-wrap & */
dbus-launch dunst --config ~/.config/dunst/dunstrc &
/usr/bin/battery-notify &
mpd &
/* kdeconnect-indicator & */
nm-applet &
picom --experimental-backends &

xset r rate 300 50
numlockx on
setxkbmap -layout 'us,ara' -variant altgr-intl,qwerty -option 'grp:alt_shift_toggle'
setxkbmap -option caps:swapescape

while true 
do
  R1=`cat /sys/class/net/wlan0/statistics/rx_bytes`
  T1=`cat /sys/class/net/wlan0/statistics/tx_bytes`
  sleep 1
  R2=`cat /sys/class/net/wlan0/statistics/rx_bytes`
  T2=`cat /sys/class/net/wlan0/statistics/tx_bytes`
  BC=`cat /sys/class/power_supply/BAT0/capacity`
  BS=`cat /sys/class/power_supply/BAT0/status`
  TBPS=`expr $T2 - $T1`
  RBPS=`expr $R2 - $R1`
  TKBPS=`expr $TBPS / 1024`
  RKBPS=`expr $RBPS / 1024`
  xsetroot -name "$RKBPS ⇵ $TKBPS | $(xkblayout) | $BC ${BS:0:1} | $(date '+%H:%M') |"
  sleep 1
done & 

exec dwm
