#!/bin/sh -e
#
# dotfiles installation script
#
# Author: Darryl Abbate
# https://github.com/rootbeersoup/dotfiles
#
# Install by running either command:
# curl -fsSL get.darryl.sh | sh
# wget -qO- get.darryl.sh | sh

# Exit if a dotfiles directory already exists
dotfiles_check ()
{
  if [ -d "$HOME/dotfiles" ]; then
    printf "\\033[31mERROR:\\033[0m ~/dotfiles already exists on this system.\\n" >&2
    exit 1
  fi
}

# Full installation function
make_install ()
{
  # Keep sudo alive for the entire session
  sudo -v
  while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

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
  git clone --recursive https://github.com/rootbeersoup/dotfiles.git "$HOME/dotfiles"
  cd "$HOME/dotfiles" || exit 1
  make
}

# Temp symlink function
# Download tar.gz if git isn't installed
make_links ()
{
  if ! [ -x "$(command -v git)" ]; then
    if [ -x "$(command -v curl)" ]; then
      curl -L https://github.com/rootbeersoup/dotfiles/archive/master.tar.gz -o "$HOME/dotfiles-master.tar.gz"
      tar xzf "$HOME/dotfiles-master.tar.gz"
      mv "$HOME/dotfiles-master" "$HOME/dotfiles"
      cd "$HOME/dotfiles" || exit 1
      make links
    elif [ -x "$(command -v wget)" ]; then
      wget -O "$HOME/dotfiles-master.tar.gz" https://github.com/rootbeersoup/dotfiles/archive/master.tar.gz
      tar xzf "$HOME/dotfiles-master.tar.gz"
      mv "$HOME/dotfiles-master" "$HOME/dotfiles"
      cd "$HOME/dotfiles" || exit 1
      make links
    fi
  else
    git clone --recursive https://github.com/rootbeersoup/dotfiles.git "$HOME/dotfiles"
    cd "$HOME/dotfiles" || exit 1
    make links
  fi
}

main ()
{
  # Display warning and prompt user to confirm before proceeding
  printf "\\n\
\\033[1mDOTFILES\\033[0m\\n\
\\n\
Custom macOS settings and terminal configurations.\\n\
https://github.com/rootbeersoup/dotfiles\\n\
\\n\
\\033[1mOPTIONS:\\033[0m\\n\
\\n\
  Full        Full installation, which will install new programs.\\n\
              Suitable for personal computer setup.\\n\
\\n\
  Symlinks    Only make symlinks to Bash and Vim configurations.\\n\
              Suitable for temporary or shared computer configuration.\\n\
\\n\
\\033[31mWARNING:\\033[0m This will install new files and may overwrite some existing\\n\
         files in your home directory.\\n\
\\n\
Continue? ([F]ull, [S]ymlinks, [C]ancel)\\n\
> "
  read -r REPLY
  if [ "$REPLY" = F ] || [ "$REPLY" = f ]; then
    printf "Installing dotfiles...\\n"
    make_install
  elif [ "$REPLY" = S ] || [ "$REPLY" = s ]; then
    printf "Downloading dotfiles and creating symlinks...\\n"
    make_links
  else
    printf "Process terminated by user.\\n" >&2
    exit 1
  fi
}

dotfiles_check
main
