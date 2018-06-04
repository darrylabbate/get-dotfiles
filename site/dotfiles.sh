#!/usr/bin/env bash
#
#     /\\\                                  /\\\\\        /\\\\\\                              
#     \/\\\                                /\\\///   /\\\ \////\\\                              
#      \/\\\                  /\\\         /\\\      \///     \/\\\                              
#       \/\\\     /\\\\\    /\\\\\\\\\\\ /\\\\\\\\\ /\\\\\\    \/\\\       /\\\\\\\\   /\\\\\\\\\\
#   /\\\\\\\\\   /\\\///\\\ \////\\\//// \////\\\// \////\\\    \/\\\     /\\\/////\\\ \/\\\//////
#   /\\\////\\\  /\\\  \//\\\   \/\\\        \/\\\      \/\\\    \/\\\    /\\\\\\\\\\\  \/\\\\\\\\\\
#   \/\\\  \/\\\ \//\\\  /\\\    \/\\\ /\\    \/\\\      \/\\\    \/\\\   \//\\///////   \////////\\\
#    \//\\\\\\\/\\ \///\\\\\/     \//\\\\\     \/\\\      \/\\\    \/\\\\\\ \//\\\\\\\\\\  /\\\\\\\\\\
#      \///////\//    \/////        \/////      \///       \///     \//////   \//////////  \//////////
#
#
#  This is an installation script for Darryl Abbate's dotfiles
#  https://github.com/rootbeersoup/dotfiles
#
#  Install by running this command:
#  curl get.darryl.sh | sh


# Install git

function installgit() {
  if [ "$(uname -s)" == "Darwin" ]; then  # macOS
    xcode-select --install
  elif [ "$(uname -s)" == "Linux" ]; then # Ubuntu
    sudo apt-get install git -y
  fi
}


# Keep sudo alive for the entire session

sudo -v
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &


# Ask for confirmation before proceeding
# Script will proceed upon press of 'Y' key (case-insensitive); It will not listen for a carriage return

echo ""
echo "Darryl Abbate's dotfiles"
echo ""
echo "WARNING: This will install new files and may overwrite some existing files in your home directory."
echo ""
read -p "  Continue? <Y/N> " -n 1 -r
echo ""
if [[ $REPLY =~ ^[Yy]$ ]]
then
  echo "Installing dotfiles..."
fi

# Do the thing

installgit                                                            # Install git
git clone --recursive https://github.com/rootbeersoup/dotfiles.git ~  # Clone the dotfiles repo to the home directory
cd dotfiles                                                           # Enter ~/dotfiles
make                                                                  # Invoke the Makefile
