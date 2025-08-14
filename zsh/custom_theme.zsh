# This script file is used for custom zsh theme

# set ls dir color, use env var LSCOLORS
export LSCOLORS="exgxbxdxcxexexabagacad"

# set terminal prompt style
# macOS default PROMPT="%n@%m %1~ %# "
# 启用颜色支持
autoload -Uz colors && colors
# 定义颜色别名（可选）
PROMPT_BLACK="%{$fg[black]%}"
PROMPT_RED="%{$fg[red]%}"
PROMPT_BLUE="%{$fg[blue]%}"
PROMPT_GREEN="%{$fg[green]%}"
PROMPT_YELLOW="%{$fg[yellow]%}"
PROMPT_MAGENTA="%{$fg[magenta]%}"
PROMPT_CYAN="%{$fg[cyan]%}"
PROMPT_WHITE="%{$fg[white]%}"
PROMPT_RESET="%{$reset_color%}"
PROMPT="%n@%m ${PROMPT_BLUE}%1~${PROMPT_RESET} %# "
