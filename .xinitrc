# hash fswebcam && fswebcam -q --no-banner -r 1280x720 ~/private/login-photos/$(date +%Y-%m-%dT%H).jpg &

setxkbmap -model thinkpad -layout us -option ctrl:nocaps
xrdb -merge .Xresources &
xrandr --dpi 192 &
xset -b &
# slstatus &
exec xmonad
