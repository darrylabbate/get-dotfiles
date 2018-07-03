#!/bin/sh
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
# dotfiles installation script
# Author: Darryl Abbate
# https://github.com/rootbeersoup/dotfiles
#
# Install by running this command:
# curl get.darryl.sh | sh


# Keep sudo alive for the entire session

sudo -v
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &


# Display info

echo ""
echo "━━━ Darryl Abbate's dotfiles ━━━━━━━━━━━"
echo ""
echo "WARNING: This will install new files and may overwrite some existing files in your home directory."
echo ""
echo "Press CTRL + C now to terminate this process."
echo ""


# Countdown to liftoff

for i in {5..1}; do 
  printf "Installing...$i \r"
  sleep 1
done


# Install git if not already installed
# Install Homebrew on macOS since it installs Xcode Command-Line Tools automatically

if ! [ -x "$(command -v git)" ]; then
  if [ "$(uname -s)" = "Darwin" ]; then
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    brew install git
  elif [ "$(uname -s)" = "Linux" ]; then
    sudo apt-get install git -y
  fi
fi


# Clone the dotfiles repository, invoke the Makefile

git clone --recursive https://github.com/rootbeersoup/dotfiles.git $HOME
cd $HOME/dotfiles
make
