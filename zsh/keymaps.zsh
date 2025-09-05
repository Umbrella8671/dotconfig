# This script file is used for my keymap

zle_yazi_widget () {
  yazi
  zle reset-prompt
}
zle -N zle_yazi_widget
bindkey "^f" zle_yazi_widget
