#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

PS1='$(prompt) \$ '

PATH=~/bin:~/.local/bin:$PATH:/usr/local/go/bin
export EDITOR=nvim
export LANG=en_US.UTF-8
#export GDK_BACKEND=wayland
export MOZ_ENABLE_WAYLAND=1
export PATH

set -b

alias ed='ed -p "% "'

alias ls='ls --color=auto'
alias diff='diff --color=auto'
alias grep='grep --color=auto'
alias ip='ip -color=auto'
alias n='newsboat -u $HOME/.newsboat/urls -c $HOME/.newsboat/cache.db'
alias y='newsboat -u $HOME/.newsboat/youtube-urls -c $HOME/.newsboat/youtube-cache.db'
alias glances='glances --disable-bg'
alias ss='mpv --profile=skipsilence'
alias qutebrowser='qutebrowser --qt-flag ignore-gpu-blacklist --qt-flag enable-gpu-rasterization --qt-flag enable-native-gpu-memory-buffers --qt-flag num-raster-threads=4'
alias wtr='curl v2.wttr.in'

[ -r ~/.cache/wal/sequences ] && (cat ~/.cache/wal/sequences &)
[ -r ~/.cache/wal/colors-tty.sh ] && source ~/.cache/wal/colors-tty.sh

[ -r $HOME/.asdf/asdf.sh ] && . $HOME/.asdf/asdf.sh
[ -r $HOME/.asdf/completions/asdf.bash ] && . $HOME/.asdf/completions/asdf.bash
[ -r /usr/share/bash-completion/bash_completion ] && . /usr/share/bash-completion/bash_completion

alias pac=yay  # For convenience

# pacmatic needs to be run as root: https://github.com/keenerd/pacmatic/issues/35
alias pacmatic='sudo --preserve-env=pacman_program /usr/bin/pacmatic'

# Downgrade permissions as AUR helpers expect to be run as a non-root user. $UID is read-only in {ba,z}sh.
alias pac=yay  # For convenience

# pacmatic needs to be run as root: https://github.com/keenerd/pacmatic/issues/35
alias pacmatic='sudo --preserve-env=pacman_program /usr/bin/pacmatic'

# Downgrade permissions as AUR helpers expect to be run as a non-root user. $UID is read-only in {ba,z}sh.
alias yay='pacman_program="sudo -u #$UID /usr/bin/yay --pacman powerpill" pacmatic'

alias yay='pacman_program="sudo -u #$UID /usr/bin/yay --pacman powerpill" pacmatic'

