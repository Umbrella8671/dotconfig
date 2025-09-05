# This script file is used for zsh completion

# zsh的自动补全与高亮
autoload -Uz compinit && compinit

[[ -d "$HOME/.config/zsh/modules/fast-syntax-highlighting/" ]] && source "$HOME/.config/zsh/modules/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh"
[[ -d "$HOME/.config/zsh/modules/zsh-autosuggestions/" ]] && source "$HOME/.config/zsh/modules/zsh-autosuggestions/zsh-autosuggestions.plugin.zsh"
[[ -d "$HOME/.config/zsh/modules/zsh-history-substring-search/" ]] && source "$HOME/.config/zsh/modules/zsh-history-substring-search/zsh-history-substring-search.plugin.zsh"
[[ -d "$HOME/.config/zsh/modules/fzf-tab/" ]] && source "$HOME/.config/zsh/modules/fzf-tab/fzf-tab.plugin.zsh"

command -v uv &> /dev/null && source <(uv generate-shell-completion zsh)
command -v uvx &> /dev/null && source <(uvx --generate-shell-completion zsh)
command -v fzf &> /dev/null && source <(fzf --zsh)
