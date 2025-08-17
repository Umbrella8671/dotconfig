# magic theme


# fpath=("${HOME}/.config/zsh/modules/git/functions" "${HOME}/.config/zsh/modules/duration-info/functions" "${HOME}/.config/zsh/modules/git-info/functions" "${HOME}/.config/zsh/modules/prompt-pwd/functions" ${fpath})
# autoload -Uz -- git-alias-lookup git-branch-current git-branch-delete-interactive git-branch-remote-tracking git-dir git-ignore-add git-root git-stash-clear-interactive git-stash-recover git-submodule-move git-submodule-remove duration-info-precmd duration-info-preexec coalesce git-action git-info prompt-pwd
# source "${HOME}/.config/zsh/modules/git/init.zsh"
# HELP_DIR=$HOME.config/zsh/modules/git/functions/
# autoload -Uz -- $HELP_DIR/git-alias-lookup $HELP_DIR/git-branch-current $HELP_DIR/git-branch-delete-interactive $HELP_DIR/git-branch-remote-tracking $HELP_DIR/git-dir $HELP_DIR/git-ignore-add $HELP_DIR/git-root $HELP_DIR/git-stash-clear-interactive $HELP_DIR/git-stash-recover $HELP_DIR/git-submodule-move $HELP_DIR/git-submodule-remove 
# source "${HOME}/.config/zsh/modules/git/init.zsh"
autoload -Uz -- $HOME/.config/zsh/modules/duration-info/functions/duration-info-precmd $HOME/.config/zsh/modules/duration-info/functions/duration-info-preexec
autoload -Uz -- $HOME/.config/zsh/modules/git-info/functions/coalesce $HOME/.config/zsh/modules/git-info/functions/git-action $HOME/.config/zsh/modules/git-info/functions/git-info
autoload -Uz -- $HOME/.config/zsh/modules/prompt-pwd/functions/prompt-pwd

source $HOME/.config/zsh/modules/magicmace/magicmace.zsh-theme

# zstyle ':zim:git' aliases-prefix 'g'