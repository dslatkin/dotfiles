# Initially generated from $(brew --prefix)/opt/fzf/install

# todo: Test on Linux

# Setup fzf
if [[ ! "$PATH" == */opt/homebrew/opt/fzf/bin* ]]; then
  PATH="${PATH:+${PATH}:}/opt/homebrew/opt/fzf/bin"
fi

# Auto-completion
# shellcheck disable=SC1091
[[ $- == *i* ]] && source "/opt/homebrew/opt/fzf/shell/completion.bash" 2> /dev/null

# Key bindings
# shellcheck disable=SC1091
source "/opt/homebrew/opt/fzf/shell/key-bindings.bash"
