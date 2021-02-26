#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

PS1='$(prompt) \$ '

export ENV=~/.env
PATH=~/bin/$HOSTNAME:~/bin/$(uname -m):~/bin:~/.local/bin:$PATH
export EDITOR=vim
export LANG=en_US.UTF-8
export PYTHONPATH=~/lib/python3:~/sources/core.sr.ht/:~/sources/scm.sr.ht
export GOPATH=~/.local/share/go
export GOPROXY=direct
#export GDK_BACKEND=wayland
export MOZ_ENABLE_WAYLAND=1
export PATH

export LESS=-R
export LESS_TERMCAP_mb=$'\E[1;31m'     # begin blink
export LESS_TERMCAP_md=$'\E[1;36m'     # begin bold
export LESS_TERMCAP_me=$'\E[0m'        # reset bold/blink
export LESS_TERMCAP_so=$'\E[01;44;33m' # begin reverse video
export LESS_TERMCAP_se=$'\E[0m'        # reset reverse video
export LESS_TERMCAP_us=$'\E[1;32m'     # begin underline
export LESS_TERMCAP_ue=$'\E[0m'        # reset underline

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

(cat ~/.cache/wal/sequences &)
source ~/.cache/wal/colors-tty.sh
