# This script file is used for zsh completion

# zsh的自动补全与高亮
autoload -Uz compinit && compinit

source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# source $HOME/.config/zsh/completions/uv.zsh
# source $HOME/.config/zsh/completions/uvx.zsh
source <(uv generate-shell-completion zsh)
source <(uvx --generate-shell-completion zsh)
