#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# [ -r ~/.cache/wal/sequences ] && (/usr/bin/cat ~/.cache/wal/sequences &)
# [ -r ~/.cache/wal/colors-tty.sh ] && source ~/.cache/wal/colors-tty.sh

if ! pgrep -u "$USER" ssh-agent > /dev/null; then
    ssh-agent -t 1h > "$XDG_RUNTIME_DIR/ssh-agent.env"
fi
if [[ ! "$SSH_AUTH_SOCK" ]]; then
    source "$XDG_RUNTIME_DIR/ssh-agent.env" >/dev/null
fi

PS1='$(prompt) \$ '

export PATH=~/bin:~/.local/bin:$PATH:/usr/local/go/bin
export EDITOR=nvim
export LANG=en_US.UTF-8
#export GDK_BACKEND=wayland
export MOZ_ENABLE_WAYLAND=1
export GTK_IM_MODULE=ibus
export XMODIFIERS=@im=ibus
export QT_IM_MODULE=ibus
export QT_QPA_PLATFORM=wayland

set -b

alias ed='ed -p "% "'
alias diff='diff --color=auto'
alias grep='grep --color=auto'
alias ip='ip -color=auto'
alias n='newsboat -u $HOME/.newsboat/urls -c $HOME/.newsboat/cache.db'
alias y='newsboat -u $HOME/.newsboat/youtube-urls -c $HOME/.newsboat/youtube-cache.db'
alias glances='glances --disable-bg'
alias ss='mpv --profile=skipsilence'
alias qutebrowser='qutebrowser --qt-flag ignore-gpu-blacklist --qt-flag enable-gpu-rasterization --qt-flag enable-native-gpu-memory-buffers --qt-flag num-raster-threads=4'
alias wtr='curl v2.wttr.in'
alias cat='bat'
alias ls='lsd'
alias ll='ls -l'
alias la='ls -a'

[ -r /usr/share/bash-completion/bash_completion ] && . /usr/share/bash-completion/bash_completion
