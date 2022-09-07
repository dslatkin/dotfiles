#!/bin/bash

# Functions
mcd () {
  mkdir "$1" && cd "$1"
}
rfr () {
  rm -fr $*
}

# Chezmoi completions
eval "$(chezmoi completion bash)"

# Brew completions
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
if type brew &>/dev/null
then
  HOMEBREW_PREFIX="$(brew --prefix)"
  if [[ -r "${HOMEBREW_PREFIX}/etc/profile.d/bash_completion.sh" ]]
  then
    source "${HOMEBREW_PREFIX}/etc/profile.d/bash_completion.sh"
  else
    for COMPLETION in "${HOMEBREW_PREFIX}/etc/bash_completion.d/"*
    do
      [[ -r "${COMPLETION}" ]] && source "${COMPLETION}"
    done
  fi
fi

# Starship completions
eval "$(starship init bash)"
eval "$(starship completions bash)"
