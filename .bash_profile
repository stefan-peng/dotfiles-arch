#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc

if [[ ! $DISPLAY && $XDG_VTNR -eq 1 ]]; then
        echo "Enter 'q' for nothing, or anything else for sway"
        read selection && case $selection in
                q)
                        ;;
                *)
                        export QT_QPA_PLATFORM=wayland-egl
                        export QT_WAYLAND_DISABLE_WINDOWDECORATION=1 # Qt adds titlebars under Wayland, this gets rid of them
                        #export SDL_VIDEODRIVER=wayland # causes issues with lots of games
                        export CLUTTER_BACKEND=wayland
                        export BEMENU_BACKEND=wayland
                        export KITTY_ENABLE_WAYLAND=1
			export MOZ_ENABLE_WAYLAND=1
                        sway
                        ;;
        esac
fi
