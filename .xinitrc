userresources=$HOME/.Xresources
export BROWSER=/usr/bin/firefox-developer-edition
export EDITOR=/usr/bin/nvim

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

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.bin" ] ; then
    PATH="$HOME/.bin:$PATH"
fi
if [ -d "$HOME/Applications" ] ; then
    PATH="$HOME/Applications:$PATH"
fi


# Prepend a custom font path to Xorg's list of known font paths
xset +fp $HOME/.fonts 

feh --bg-fill --randomize --recursive $HOME/Pictures/Nord/space-mars-4480x2520-nordified.jpg &
dbus-launch dunst --config ~/.config/dunst/dunstrc &
$HOME/.bin/battery-notify &
redshift &
mpd &
/* kdeconnect-indicator & */
nm-applet &
picom --experimental-backends  &

xrandr --setprovideroutputsource modesetting NVIDIA-0
xrandr --auto
xrandr -s 1920x1080+0+0

xset r rate 300 50
numlockx on
setxkbmap -layout 'us,ara' -variant altgr-intl,qwerty -option 'grp:alt_shift_toggle'
setxkbmap -option caps:swapescape

while true 
do
  R1=`cat /sys/class/net/wlp0s20f3/statistics/rx_bytes`
  T1=`cat /sys/class/net/wlp0s20f3/statistics/tx_bytes`
  sleep 1
  R2=`cat /sys/class/net/wlp0s20f3/statistics/rx_bytes`
  T2=`cat /sys/class/net/wlp0s20f3/statistics/tx_bytes`
  BC=`cat /sys/class/power_supply/BAT0/capacity`
  BS=`cat /sys/class/power_supply/BAT0/status`
  TBPS=`expr $T2 - $T1`
  RBPS=`expr $R2 - $R1`
  TKBPS=`expr $TBPS / 1024`
  RKBPS=`expr $RBPS / 1024`
  xsetroot -name "$RKBPS ⇵ $TKBPS │ $(xkblayout) │ $BC ${BS:0:1} │ $(date '+%H:%M')"
  sleep 1
done & 

exec dwm
