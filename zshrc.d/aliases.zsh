#!/bin/zsh

# single character aliases - be sparing!
alias _=sudo
alias l=ls
alias g=git

# mask built-ins with better defaults
alias vi=nvim
alias vim=nvim
alias lg=lazygit

# more ways to ls
alias ll='ls -lh'
alias la='ls -lAh'
alias ldot='ls -ld .*'

# fix common typos
alias quit='exit'
alias cd='z'
alias cd..='z ..'

# tar
alias tarls="tar -tvf"
alias untar="tar -xf"

# misc
alias please=sudo
alias zbench='for i in {1..10}; do /usr/bin/time zsh -lic exit; done'
alias zdot='cd ${ZDOTDIR:-~}'
