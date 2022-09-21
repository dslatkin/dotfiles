#!/bin/zsh

# Aliases
alias cz=chezmoi

# Functions
mcd () {
  mkdir "$1" && cd "$1" || exit
}
rfr () {
  rm -fr "$*"
}

# Chezmoi completions
eval "$(chezmoi completion zsh)"
