# This script file is used for alias

if [[ "$(uname)" == "Darwin" ]]; then
  alias ls='ls -G'
  alias ll='ls -lh'
else
  alias ls='ls --color=auto'
  alias ll='ls -lh'
fi

alias gitlog='git log --graph --oneline --all --decorate'
