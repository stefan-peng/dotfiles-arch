#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

PS1='$(prompt) \$ '

PATH=~/bin/$HOSTNAME:~/bin/$(uname -m):~/bin:~/.local/bin:$PATH
export EDITOR=vim
export LANG=en_US.UTF-8
export GDK_BACKEND=wayland
export MOZ_ENABLE_WAYLAND=1
export PATH

set -b

if [ -z "${SSH_AGENT_PID}" ]
then
	if ! [ -e "/tmp/ssh-agent-$USER" ]
	then
		ssh-agent 2>/dev/null >"/tmp/ssh-agent-$USER"
	fi
	. "/tmp/ssh-agent-$USER" >/dev/null
fi

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

(cat ~/.cache/wal/sequences &)
source ~/.cache/wal/colors-tty.sh
