#!/usr/bin/env zsh

add_symlink() {
	local src=$1
	local dst=$2

	if [[ ! -a $HOME/$dst ]]; then
		if ln -s .config/$src $HOME/$dst; then
			print -P "%{%F{green}%}✔%{%F{default}%} $dst successfully symlinked"
		else
			print -P "%{%F{red}%}✘%{%F{default}%} error symlinking $dst"
		fi
	else
		print -P "%{%F{default}%}●%{%F{default}%} $dst already exists"
	fi
}

# zsh
add_symlink "zsh/zshrc" ".zshrc"

# vim
add_symlink "nvim/init.vim" ".vimrc"

# git
add_symlink "git/gitconfig" ".gitconfig"

# ghci
add_symlink "ghci/ghciconfig" ".ghci"

#psql
add_symlink "psql/psqlrc" ".psqlrc"
