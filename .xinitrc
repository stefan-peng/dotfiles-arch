#!/bin/sh

# note that other key startup items are run via bin/wm/init-tilingwm


xrdb -load $HOME/.Xresources


# ----------------------------------------------------------------------
# CapsLock as CTRL
setxkbmap -option ctrl:nocaps

# ----------------------------------------------------------------------
# run xsettingsd in lieu of gnome-settings-daemon
# this helps pass certain values to gtk programs (fonts, for example)
# cf https://github.com/derat/xsettingsd/wiki/Installation
# TODO: wiki mentions using .xsession .. should i be using that instead
# of .xprofile? just move into my init file? make a new .shell like
# config file or folder?

/usr/bin/xsettingsd &

# ----------------------------------------------------------------------
# resolution & display 

#xrandr --setprovideroutputsource modesetting NVIDIA-0
xrandr --dpi 210

# Calling 'displayctl' without arguments is the same as calling it with
# 'auto'. This will scan the current set of connected displays, check to
# see if I have a preferred configuration via automatically recorded
# connection data, and if so will apply either that value or a default
# based on state of connected external displays.

# x is crashing on startup due to displayctl!!!
#$HOME/bin/wm/displayctl

export TERMINAL=urxvt
 export GTK_IM_MODULE=fcitx
 export QT_IM_MODULE=fcitx
 export XMODIFIERS=@im=fcitx

redshift &
xscreensaver &
xbindkeys &
fcitx &
unclutter &
exec xmonad
