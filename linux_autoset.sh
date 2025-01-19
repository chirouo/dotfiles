#!/bin/bash
DOTFILE_REPO_URL="https://github.com/chirouo/dotfile.git"
DOTFILE_DIR="$HOME/dotfiles"

if [[ -d ".git" ]]; then
	echo "Had cloned dotfile's git repo.Pull the latest changes..." >&2
	git pull
else 
	echo "No dotfile's repo! git clone ing..." >&2
	git clone "$DOTFFILE_REPO_URL"
fi
ln -fs ~/dotfiles/vim/.vimrc ~/.vimrc
ln -fs ~/dotfiles/tmux/.tmux.conf ~/.tmux.conf
ln -fs ~/dotfiles/bash/.bashrc ~/.bashrc
