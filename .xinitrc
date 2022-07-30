# hash fswebcam && fswebcam -q --no-banner -r 1280x720 ~/private/login-photos/$(date +%Y-%m-%dT%H).jpg &

xrdb -load .Xresources &
xset -b &
redshift -l 39.2046 -77.2290 &
exec xmonad
