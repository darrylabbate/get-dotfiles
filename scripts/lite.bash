#!/usr/bin/env bash
#
# A minimal Bash configuration
#
# Author: Darryl Abbate
# https://darryl.sh
# https://github.com/rootbeersoup
#
# Install by running either command:
# curl -fsSL get.darryl.sh/lite | bash
# or
# wget -qO- get.darryl.sh/lite | bash

# Use vim keybindings in the terminal
set -o vi

# Bind 'jk' and 'kj' to ESC (enters vi "normal" mode)
bind '"jk":"\e"'
bind '"kj":"\e"'

# Custom prompt
# Display red prompt if root
# Display blue prompt during SSH session
if [[ $(id -u) -eq 0 ]]; then
  PS1="\[\e[1;31m\][\h:\u]\[\e[m\] \w \[\e[1;36m\]ϟ\[\e[m\] "
elif [[ -n "$SSH_CLIENT" ]]; then
  PS1="\[\e[1;34m\][\h:\u]\[\e[m\] \w \[\e[1;36m\]ϟ\[\e[m\] "
else
  PS1="\w \[\e[1;36m\]ϟ\[\e[m\] "
fi

# Aliases
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias c="clear"
alias cpu="top -F -R -o cpu"
alias f="open ."
alias hogs="ps -acrx -o pid,%cpu,command | awk 'NR<=5'"
alias fkill="killall Finder"
alias l="ls -F"
alias la="ls -AF"
alias ll="ls -AFlo"
alias h="cd ~"
alias t="tree -C"
