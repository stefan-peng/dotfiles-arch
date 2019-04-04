#!/bin/bash -x

#xrandr --auto
#xset -b

xrdb -load "$HOME/.Xresources"


/usr/bin/xsettingsd &
xrandr --dpi 210

export GTK_IM_MODULE=ibus
export QT_IM_MODULE=ibus
export XMODIFIERS=@im=ibus

#clipmenud &
#/usr/lib/geoclue-2.0/demos/agent &
redshift &
#syncthing &

# dwm only
#slstatus &
#xss-lock slock &
#feh --bg-fill ~/tmp/wallpaper &
#ibus-daemon -drx &
#setxkbmap -model thinkpad -layout us -variant altgr-intl -option ctrl:nocaps
#compton -b --config ~/.comptonrc --xrender-sync-fence & # test as per https://github.com/chjj/compton/wiki/perf-guide

xbindkeys &
#displayctl &

#exec dwm
exec xmonad
