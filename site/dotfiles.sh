#!/usr/bin/env bash

# Install git function
function installgit() {
	if [ "$(uname -s)" == "Darwin" ]; then
		xcode-select --install
	elif [ "$(uname -s)" == "Linux" ]; then
		sudo apt-get install git -y
	fi
}

sudo -v
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

echo ""
echo "dotfiles"
echo ""
echo "WARNING: This will install new files and may overwrite some existing files in your home directory."
echo ""
read -p "  Continue? <Y/N> " -n 1 -r
echo ""
if [[ $REPLY =~ ^[Yy]$ ]]
then
	echo "Installing dotfiles..."
fi

installgit
git clone --recursive https://github.com/rootbeersoup/dotfiles.git ~
cd dotfiles
make
