#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE}")";

git pull origin master;

function doIt() {
	#rsync --exclude ".git/" \
	#	--exclude ".DS_Store" \
	#	--exclude ".osx" \
	#	--exclude "bootstrap.sh" \
	#	--exclude "README.md" \
	#	--exclude "LICENSE-MIT.txt" \
	#	-avh --no-perms . ~;
  
	if [ -e "$HOME"/.vim/autoload/plug.vim ]; then
	  vim -E -s +PlugUpgrade +qa
	else
	  curl -fLo "$HOME"/.vim/autoload/plug.vim --create-dirs \
	      https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	fi
	vim +PlugUpdate +PlugClean! +qa
}

if [ "$1" == "--force" -o "$1" == "-f" ]; then
	doIt;
else
	read -p "This may overwrite existing files in your home directory. Are you sure? (y/n) " -n 1;
	echo "";
	if [[ $REPLY =~ ^[Yy]$ ]]; then
		doIt;
	fi;
fi;
unset doIt;
