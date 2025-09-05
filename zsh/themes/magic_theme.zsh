# magic theme

autoload -Uz -- $HOME/.config/zsh/modules/duration-info/functions/duration-info-precmd $HOME/.config/zsh/modules/duration-info/functions/duration-info-preexec
autoload -Uz -- $HOME/.config/zsh/modules/git-info/functions/coalesce $HOME/.config/zsh/modules/git-info/functions/git-action $HOME/.config/zsh/modules/git-info/functions/git-info
autoload -Uz -- $HOME/.config/zsh/modules/prompt-pwd/functions/prompt-pwd

source $HOME/.config/zsh/modules/magicmace/magicmace.zsh-theme

# zstyle ':zim:git' aliases-prefix 'g'
