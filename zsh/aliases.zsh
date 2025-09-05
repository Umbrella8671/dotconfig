# This script file is used for alias

if [[ "$(uname)" == "Darwin" ]]; then
  alias ls='ls -G'
else
  alias ls='ls --color=auto'
fi
if [[ "$(command -v eza)" ]]; then
  alias ls='eza'
elif [[ "$(command -v lsd)" ]]; then
  alias ls='lsd'
fi
alias ll='ls -lh'

alias gitlog='git log --graph --oneline --all --decorate'
