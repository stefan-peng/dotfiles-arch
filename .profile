PS1='$(prompt) \$ '

export ENV=~/.env
export PATH=~/bin/$HOSTNAME:~/bin/$(uname -m):~/bin:$PATH
export EDITOR=vim
export LANG=en_US.UTF-8
export PYTHONPATH=~/lib/python3:~/sources/core.sr.ht/:~/sources/scm.sr.ht
export GOPATH=~/.local/share/go
export GOPROXY=direct
export GDK_BACKEND=wayland
export MOZ_ENABLE_WAYLAND=1

[ -e .config/$HOSTNAME.profile ] && . .config/$HOSTNAME.profile
