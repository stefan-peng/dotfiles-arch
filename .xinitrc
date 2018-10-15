#!/bin/bash -x

#xrandr --auto
#xset -b

xrdb -load $HOME/.Xresources

#setxkbmap -model thinkpad -layout us -variant altgr-intl -option ctrl:nocaps

/usr/bin/xsettingsd &
xrandr --dpi 210

export GTK_IM_MODULE=ibus
export QT_IM_MODULE=ibus
export XMODIFIERS=@im=ibus

#clipmenud &
/usr/lib/geoclue-2.0/demos/agent &
redshift &
#slstatus &
#xss-lock slock &
#feh --bg-fill ~/tmp/wallpaper.jpg &
xbindkeys &
#ibus-daemon -drx &
displayctl &
exec xmonad
