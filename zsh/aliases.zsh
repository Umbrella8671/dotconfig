# This script file is used for alias

if [[ "$(uname)" == "Darwin" ]]; then
  alias ls='ls -G'
  alias ll='ls -lh'
else
  alias ls='ls --color=auto'
  alias ll='ls -lh'
fi

if [[ "$(command -v eza)" ]]; then
  alias ls='eza'
elif [[ "$(command -v lsd)" ]]; then
  alias ls='lsd'
  
fi
alias gitlog='git log --graph --oneline --all --decorate'
